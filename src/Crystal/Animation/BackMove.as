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
		private var cristalMove1:Unit;
		private var cristalMove2:Unit;
		private var destinationMove:String = "";
		/* -------------------------------------------------------- */
		
		public function BackMove(cristal1:Unit, cristal2:Unit, destination:String) 
		{
			cristalMove1 = cristal1;
			cristalMove2 = cristal2;
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
					cristalMove1.x += 10;
					cristalMove2.x -= 10;
				}else {
					cristalMove1.x -= 10;
					cristalMove2.x += 10;
				}
			}
			if (destinationMove == "Left:I-1") {
				if(repeat > 4){
					cristalMove1.x -= 10;
					cristalMove2.x += 10;
				}else {
					cristalMove1.x += 10;
					cristalMove2.x -= 10;
				}
			}
			if (destinationMove == "Up:J-1") {
				if(repeat > 4){
					cristalMove1.y -= 10;
					cristalMove2.y += 10;
				}else {
					cristalMove1.y += 10;
					cristalMove2.y -= 10;
				}
			}
			if (destinationMove == "Down:J+1") {
				if(repeat > 4){
					cristalMove1.y += 10;
					cristalMove2.y -= 10;
				}else {
					cristalMove1.y -= 10;
					cristalMove2.y += 10;
				}
			}
        }

        private function completeHandler(e:TimerEvent):void 
		{
			// таймер остановлен
		}
		
	}

}