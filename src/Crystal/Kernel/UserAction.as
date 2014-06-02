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
		}
		
		/* Событие при завершении работы таймера */
        private function completeHandler(e:TimerEvent):void
		{
		
		}
	}

}