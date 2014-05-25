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
		
		public function DownMove(j:int, crystal:Unit) 
		{
			indexI = crystal.IndexI;
			indexJ = crystal.IndexJ
				
			/* Перемещаем кристал вниз столбца */
			if (j != indexJ) {
				var difference:int = difference = 50 * (j - indexJ); // разница = 50 * (ИндексСтрокаНовая - ИндексСтрокаСтарая)
				endPosY = crystal.y + difference; // конечная позиция по Y
				repeat = (endPosY - crystal.y) * 0.1; // количество ходов анимации
				timer.addEventListener(TimerEvent.TIMER, timerHandler);
				timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
				timer.start();
				trace("НАЧАЛО: Индекс I=" + indexI.toString() + "  Индекс J=" + indexJ.toString() + " | " + repeat.toString());
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