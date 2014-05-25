package Crystal.Animation 
{
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
	
	import Crystal.Resource;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class Stars extends Sprite
	{
		private var imageBD:BitmapData = new BitmapData(250, 50, true, 0x000000000000); // полная картинка
		private var canvasBD:BitmapData = new BitmapData(50, 50, true, 0x000000000000); // размер выбраной картинки
		private var image:Bitmap;
		private var starImage:Bitmap;

		private var rect:Rectangle = new Rectangle(0, 0, 250, 50); //исходный размер
		private var pt:Point = new Point(0, 0); // начальная точка
		
		/* Таймер --------------------------------------------------*/
		private var delay:uint = 50;
        private var repeat:uint = 5;
		private var timer:Timer = new Timer(delay, repeat);
		/* -------------------------------------------------------- */

		private var fParent:Sprite;
		
		public function Stars(xPos:int, yPos:int, fieldParent:Sprite) 
		{
			fParent = fieldParent;
			
			image = new Resource.StarsImage();
			imageBD.draw(image); // загружаем картинку
			rect.x = 0;
			canvasBD.copyPixels(imageBD, rect, pt);
			starImage = new Bitmap(canvasBD);
			this.x = xPos; this.y = yPos;
			this.addChild(starImage);
			
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
            timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
			timer.start();
			
		}
		
		private function timerHandler(e:TimerEvent):void 
		{
			repeat--; // уменьшение повторов
			rect.x += 50;
			canvasBD.copyPixels(imageBD, rect, pt);
			starImage = new Bitmap(canvasBD);
        }

        private function completeHandler(e:TimerEvent):void 
		{
			// таймер остановлен
			fParent.removeChild(this);
			trace("Анимация: Звёзды.");
		}
	}

}