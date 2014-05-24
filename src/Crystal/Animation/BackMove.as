package Crystal.Animation 
{
	import Crystal.Units.Unit;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class BackMove 
	{
		/* Таймер --------------------------------------------------*/
		private var delay:uint = 50;
        private var repeat:uint = 10;
		private var timer:Timer = new Timer(delay, repeat);
		private var crystalMove1:Unit;
		private var crystalMove2:Unit;
		private var destinationMove:String = "";
		/* -------------------------------------------------------- */
		
		public function BackMove(crystal1:Unit, crystal2:Unit, destination:String) 
		{
			crystalMove1 = crystal1;
			crystalMove2 = crystal2;
			destinationMove = destination;
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
            timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
		}
		
		private function timerHandler(e:TimerEvent):void 
		{
			repeat--; // уменьшение повторов
			if (destinationMove == "Right:I+1") {
				if(repeat > 4){
					crystalMove1.x += 10;
					crystalMove2.x -= 10;
				}else {
					crystalMove1.x -= 10;
					crystalMove2.x += 10;
				}
			}
			if (destinationMove == "Left:I-1") {
				if(repeat > 4){
					crystalMove1.x -= 10;
					crystalMove2.x += 10;
				}else {
					crystalMove1.x += 10;
					crystalMove2.x -= 10;
				}
			}
			if (destinationMove == "Up:J-1") {
				if(repeat > 4){
					crystalMove1.y -= 10;
					crystalMove2.y += 10;
				}else {
					crystalMove1.y += 10;
					crystalMove2.y -= 10;
				}
			}
			if (destinationMove == "Down:J+1") {
				if(repeat > 4){
					crystalMove1.y += 10;
					crystalMove2.y -= 10;
				}else {
					crystalMove1.y -= 10;
					crystalMove2.y += 10;
				}
			}
        }

        private function completeHandler(e:TimerEvent):void 
		{
			// таймер остановлен
			trace("Анимация: Возврат хода.");
		}
		
	}

}