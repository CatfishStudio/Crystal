package Crystal.Kernel 
{
	import Crystal.Units.Unit;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
	import Crystal.Resource.Resource;
	import Crystal.Kernel.Mechanics;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 * Класс: Обработка поля (проверка, удаление, сортировка, добавление кристалов всего поля)
	 */
	public class FieldHandling 
	{
		/* Таймер --------------------------------------------------*/
		private var delay:uint = 25;	// скорость таймера
        private var repeat:uint = 1;	// количество повторов
		private var timer:Timer;		// оъект таймер
		/* -------------------------------------------------------- */
		
		/* Флаги процесса выполнения -------------------------------*/
		private var performCheck:Boolean = false;	// флаг - выполнения проверки поля (поиск групп кристалов)
		private var performRemove:Boolean = false;	// флаг - выполнения удаления, сортировки и добавления кристалов в массиве
		private var performColumn0:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 0)
		private var performColumn1:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 1)
		private var performColumn2:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 2)
		private var performColumn3:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 3)
		private var performColumn4:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 4)
		private var performColumn5:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 5)
		private var performColumn6:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 6)
		private var performColumn7:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 7)
		private var performColumn8:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 8)
		private var performColumn9:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 9)
		/* -------------------------------------------------------- */
		
		public function FieldHandling() 
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
		
		/* Перезапуск таймера */
		public function Reset():void
		{
			//performCheck = false;
			performRemove = false;
			performColumn0 = false;
			performColumn1 = false;
			performColumn2 = false;
			performColumn3 = false;
			performColumn4 = false;
			performColumn5 = false;
			performColumn6 = false;
			performColumn7 = false;
			performColumn8 = false;
			performColumn9 = false;
		}
		
		/* Событие при выполнении таймера */
		private function timerHandler(e:TimerEvent):void
		{
			repeat--; 							// уменьшение повторов
			
			if (performCheck == true && performRemove == true) { // выполняется анимация перемещения кристалов вниз на пустые клетки
				if (performColumn0 == false) {	// КОЛОНКА ИНДЕКС №0
					trace(timer.repeatCount.toString());
				
					for (var row0:int = 9; row0 >= 0; row0--) {
						if (Mechanics.ResolutionMove(Resource.ArrayField[0][row0]) == true) {
							Resource.ArrayField[0][row0].y += 10;
						}
					}
				}
			}
		}

		/* Событие при завершении работы таймера */
        private function completeHandler(e:TimerEvent):void
		{
			if (performCheck == false) {		// выполняем проверку поля
				if (Mechanics.CheckField()) {	// как минимум одна группа кристалов найдена
					Reset();					// выставляем флаги по умолчанию
					performCheck = true;		// флаг - обработка выполнена
					repeat = 1;					// следующий процесс выполнения
					Perform();					// запускаем процесс выполнения
				}else Resource.BlockedField = false;	// процесс завершен - поле разблокировано
			} else {// СЛЕДУЮЩЕЕ ДЕЙСТВИЕ ---------------------------------------------------
				if (performRemove == false) {					// выполняем удаление, сортировку и добавление кристалов (анимация звёзды)
					if (Mechanics.Remove(Resource.FieldGame)) {	// удаление, добавление и сортировка выполнена
						performRemove = true;					// флаг - обработка выполнена
						repeat = 45;							// Определение максимального количества поворов для колонки
						Mechanics.DifferenceY(0); 				// Определение разницы положения кристала по Y (до и после) после проведённых изменений
						Perform();								// запускаем процесс выполнения
					}
				}else {	// СЛЕДУЮЩЕЕ ДЕЙСТВИЕ ---------------------------------------------------
					if (performColumn0 == false) {	// выполняем анимацию смещения кристалов на пустые места
						performColumn0 = true;
						
					}else { // СЛЕДУЮЩЕЕ ДЕЙСТВИЕ ---------------------------------------------------
						
					}
				}
			}
		}
	}

}