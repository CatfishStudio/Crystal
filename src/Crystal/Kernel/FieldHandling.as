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
		private var performColumn:Boolean = false;	// флаг - выполнение анимации спуска кристалов на свободные места (колонка 0)
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
			performColumn = false;
		}
		
		/* Событие при выполнении таймера */
		private function timerHandler(e:TimerEvent):void
		{
			repeat--; 							// уменьшение повторов
			
			if (performCheck == true && performRemove == true) { // выполняется анимация перемещения кристалов вниз на пустые клетки
				if (performColumn == false) {	// КОЛОНКА ИНДЕКС №0
					for (var col:int = 0; col < Resource.COLUMNS; col++){
						for (var row:int = 9; row >= 0; row--) {
							if (Mechanics.ResolutionMove(Resource.ArrayField[col][row]) == true) {
								Resource.ArrayField[col][row].y += 10;
							}
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
						Mechanics.DifferenceY(); 				// Определение разницы положения кристала по Y (до и после) после проведённых изменений
						Resource.PlaySoundMatch();				// Воспроизведение звука
						Perform();								// запускаем процесс выполнения
					}
				}else {	// СЛЕДУЮЩЕЕ ДЕЙСТВИЕ ---------------------------------------------------
					if (performColumn == false) {	// выполняем анимацию смещения кристалов на пустые места
						performColumn = true;
						Mechanics.Correction();		// Коректировка Индексов каждого кристала в массиве
						
						/* Запускаем обработку поля заново (возможно были сформированы новые комбинации) */
						var fHandling:FieldHandling = new FieldHandling();
						fHandling.Perform();
					}
				}
			}
			
			
		}
	}

}