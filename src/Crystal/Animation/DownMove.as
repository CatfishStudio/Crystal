package Crystal.Animation 
{
	import Crystal.Units.Unit;
	import Crystal.Resource;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class DownMove 
	{
		/* Таймер --------------------------------------------------*/
		private var delay:uint = 25;
        private var repeat:uint = 0;
		private var timer:Timer = new Timer(delay, repeat);
		/* -------------------------------------------------------- */
		
		private var endPosY:int = 0; // конечная координата по Y
		private var indexI:int = 0;
		private var indexJ:int = 0;
		
		public function DownMove(i:int,  j:int, crystal:Unit) 
		{
			
			indexI = i;
			indexJ = j;
				
			/* Перемещаем кристал вниз столбца */
			if (j != crystal.IndexJ && crystal.IndexJ >= 0) {
				var difference:int = 50 * (j - crystal.IndexJ); // разница = 50 * (ИндексСтрокаНовая - ИндексСтрокаСтарая)
				endPosY = crystal.y + difference; // конечная позиция по Y
				repeat = (endPosY - crystal.y) * 0.1; // количество ходов анимации
				timer.addEventListener(TimerEvent.TIMER, timerHandler);
				timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
				timer.start();
				trace("НАЧАЛО: Индекс I=" + indexI.toString() + "  Индекс J=" + indexJ.toString() + " | " + repeat.toString() + "(i=" + crystal.IndexI.toString() + " j=" + crystal.IndexJ.toString() + ")");
			} else { 
				/* Опускаем новые кристалы на пустые места */
				if (crystal.IndexJ < 0) {
					var differenceNew:int = (j * -1) * 50;
					endPosY = crystal.y + differenceNew;
					repeat = (crystal.IndexJ * -1) * 5;
					timer.addEventListener(TimerEvent.TIMER, timerHandler);
					timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
					timer.start();
					trace("НОВЫЙ КРИСТАЛ!!! НАЧАЛО: Индекс I=" + indexI.toString() + "  Индекс J=" + indexJ.toString() + " | " + repeat.toString() + "(i=" + crystal.IndexI.toString() + " j=" + crystal.IndexJ.toString() + ")");
				}
			}
		}
		
		private function timerHandler(e:TimerEvent):void 
		{
			repeat--; // уменьшение повторов
			if (repeat == 0) timer.stop();
			Resource.ArrayField[indexI][indexJ].y += 10;
			trace("ПРОЦЕСС: Индекс I=" + indexI.toString() + "  Индекс J=" + indexJ.toString() + " | " + repeat.toString());
		}

        private function completeHandler(e:TimerEvent):void 
		{
			// таймер остановлен
			trace("Анимация: Кристал опускается вниз.");
		}
	}

}