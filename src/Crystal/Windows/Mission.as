package Crystal.Windows 
{
	import flash.display.Sprite;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
	import Crystal.Resource.Resource;
	import Crystal.Text.Label;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Mission extends Sprite
	{
		/* Таймер --------------------------------------------------*/
		private var delay:uint = 25;
        private var repeat:uint = 60;
		private var timer:Timer = new Timer(delay, repeat);
		/* -------------------------------------------------------- */
		
		private var message:Sprite = new Sprite(); 	// сообщение
		private var bg:Sprite = new Sprite();		// полупрозрачный фон окна фон окна
		private var imageCrystal:Sprite = new Sprite();	// Изображение кристала.
		
		
		
		public function Mission() 
		{
			
			this.x = 0; this.y = 0;
			
			bg.graphics.lineStyle(1, 0x000000, 1);
			bg.graphics.beginFill(0x000000, 1);
			bg.graphics.drawRect(0, 0, 800, 600);
			bg.graphics.endFill();
			bg.x = 0; bg.y = 0;
			bg.alpha = 0.8;
			
			this.addChild(bg);
			
			Show();
			
		}
		
		public function Show():void
		{
			imageCrystal.addChild(Resource.CrystalImage);
			imageCrystal.y = -10;
			message.graphics.lineStyle(1, 0x000000, 1);
			message.graphics.beginFill(0x5E7597, 1);
			message.graphics.drawRect(0, 0, 800, 100);
			message.graphics.endFill();
			message.x = 0; message.y = -100;
			message.alpha = 0.8;
			message.addChild(new Label(150, 30, 700, 50, "Times New Roman", 32, 0xFFFFFF, "Соберите 100 кристалов за " + Resource.NumberOfMoves + " ходов."));
			message.addChild(imageCrystal);
			this.addChild(message);
			
			
			
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
            timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
			timer.start();
		}
		
		private function timerHandler(e:TimerEvent):void
		{
			repeat--; // уменьшение повторов
			if (repeat < 10)message.y += 50;
			else {
				if(repeat > 50)message.y += 35;
			}
        }

        private function completeHandler(e:TimerEvent):void
		{
			Resource.Level.removeChild(this);
			
			
			/* Уровеньзавершен */
			//Resource.Level.addChild(new Completed());
		}
	}

}