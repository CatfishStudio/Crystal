package Crystal.Kernel 
{
	import Crystal.Levels.Panel;
	import Crystal.Units.Unit;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
	import Crystal.Resource.Resource;
	import Crystal.Kernel.Mechanics;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 * Класс: Действие пользователя (передвижение кристалов пользователем, обмен местами, проверка)
	 */
	public class UserAction 
	{
		/* Таймер --------------------------------------------------*/
		private var delay:uint = 25;	// скорость таймера
        private var repeat:uint = 1;	// количество повторов
		private var timer:Timer;		// оъект таймер
		/* -------------------------------------------------------- */
		
		/* Флаги процесса выполнения -------------------------------*/
		private var performSwapping:Boolean = false;// флаг - выполнения обмена местами в массиве
		private var performMove:Boolean = false;	// флаг - выполнения анимации перемещения кристалов
		private var performCheck:Boolean = false;	// флаг - выполнения проверки поля (поиск групп кристалов)
		private var performSwappingBack:Boolean = false;// флаг - выполнения обратного обмена местами в массиве
		private var performMoveBack:Boolean = false;	// флаг - выполнения анимации обратного перемещения
		/* -------------------------------------------------------- */
		
		/* Информация о кристалах */
		public var ColumnCrystal1:int = 0;
		public var RowCrystal1:int = 0;
		public var ColumnCrystal2:int = 0;
		public var RowCrystal2:int = 0;
		public var Moving:String = "";
		
		public function UserAction() 
		{
			repeat = 1;	// по умолчанию один повтор
			timer = new Timer(delay, repeat);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
            timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
			
		}
		
		/* Запустить выполнение */
		public function Perform():void
		{
			Resource.BlockedField = true;		// Блокируем игровое поле. (запрещаем пользователю двигать кристалы)
			timer.repeatCount = repeat;
			timer.start();						// Запускаем работу таймера
		}
		
		/* Событие при выполнении таймера */
		private function timerHandler(e:TimerEvent):void
		{
			repeat--; 
			/* Анимация пеемещания кристалов */
			if (performSwapping == true && performSwappingBack == false) {
				if (performMove == false) {
					if (Moving == "Right:I+1") { // Смещение по горизонтале вправо
						(Resource.ArrayField[ColumnCrystal1][RowCrystal1] as Unit).x -= 10; // вправо
						(Resource.ArrayField[ColumnCrystal2][RowCrystal2] as Unit).x += 10; // влево
					}
					if (Moving == "Left:I-1") { // Смещение по горизонтале влево
						(Resource.ArrayField[ColumnCrystal1][RowCrystal1] as Unit).x += 10; // вправо
						(Resource.ArrayField[ColumnCrystal2][RowCrystal2] as Unit).x -= 10; // влево
					}
					if (Moving == "Up:J-1") { // Смещение по вертикале вверх
						(Resource.ArrayField[ColumnCrystal1][RowCrystal1] as Unit).y += 10; // вправо
						(Resource.ArrayField[ColumnCrystal2][RowCrystal2] as Unit).y -= 10; // влево
					}
					if (Moving == "Down:J+1") { // Смещение по вертикале вниз
						(Resource.ArrayField[ColumnCrystal1][RowCrystal1] as Unit).y -= 10; // вправо
						(Resource.ArrayField[ColumnCrystal2][RowCrystal2] as Unit).y += 10; // влево
					}
				}
			}
			/* Анимация пеемещания кристалов обратно */
			if (performSwapping == true && performSwappingBack == true) {
				if (performMoveBack == false) {
					if (Moving == "Right:I+1") { // Смещение по горизонтале вправо
						(Resource.ArrayField[ColumnCrystal1][RowCrystal1] as Unit).x -= 10; // вправо
						(Resource.ArrayField[ColumnCrystal2][RowCrystal2] as Unit).x += 10; // влево
					}
					if (Moving == "Left:I-1") { // Смещение по горизонтале влево
						(Resource.ArrayField[ColumnCrystal1][RowCrystal1] as Unit).x += 10; // вправо
						(Resource.ArrayField[ColumnCrystal2][RowCrystal2] as Unit).x -= 10; // влево
					}
					if (Moving == "Up:J-1") { // Смещение по вертикале вверх
						(Resource.ArrayField[ColumnCrystal1][RowCrystal1] as Unit).y += 10; // вправо
						(Resource.ArrayField[ColumnCrystal2][RowCrystal2] as Unit).y -= 10; // влево
					}
					if (Moving == "Down:J+1") { // Смещение по вертикале вниз
						(Resource.ArrayField[ColumnCrystal1][RowCrystal1] as Unit).y -= 10; // вправо
						(Resource.ArrayField[ColumnCrystal2][RowCrystal2] as Unit).y += 10; // влево
					}
				}
			}
		}
		
		/* Событие при завершении работы таймера */
        private function completeHandler(e:TimerEvent):void
		{
			if (performSwapping == false) { 	// выполняем смену мест кристалов в массиве
				performSwapping = true;
				Mechanics.ExchangeCrystals(ColumnCrystal1, RowCrystal1, ColumnCrystal2, RowCrystal2);
				repeat = 6;
				Perform();
				trace("СМЕЩЕНИЕ: " + Moving);
			} else {	// СЛЕДУЮЩЕЕ ДЕЙСТВИЕ ---------------------------------------------------
				if (performMove == false) {		// выполняем анимацию смена мест кристалов
					performMove = true;
					if (Mechanics.CheckField()) {	// ГРУППА СФОРМИРОВАНА
						(Resource.LevelPanel as Panel).ReductionMoves();
						/* Запускаем обработку поля */
						var fHandling:FieldHandling = new FieldHandling();
						fHandling.Perform();
						trace("ГРУППА СФОРМИРОВАНА!");
					}else {	// группа кристалов НЕ СФОРМИРОВАНА, возвращаем кристал на прежнее место
						repeat = 1;
						Perform();
						trace("ГРУППА НЕ СФОРМИРОВАНА!");
					}
				} else { // СЛЕДУЮЩЕЕ ДЕЙСТВИЕ ---------------------------------------------------
					if (performSwappingBack == false) {	// выполняем обратную смену мест кристалов в массиве
						performSwappingBack = true;
						Mechanics.ExchangeCrystals(ColumnCrystal1, RowCrystal1, ColumnCrystal2, RowCrystal2);
						repeat = 12;
						Perform();
						trace("ОБРАТНОЕ СМЕЩЕНИЕ: " + Moving);
					} else { // СЛЕДУЮЩЕЕ ДЕЙСТВИЕ ---------------------------------------------------
						if (performMoveBack == false) { // выполняем анимацию обратной смены мест кристалов
							performMoveBack = true;
							Resource.BlockedField = false;
							trace("ОБРАТНОЕ СМЕЩЕНИЕ (анимация): " + Moving);
						}
					}
				}
			}
		}
	}

}