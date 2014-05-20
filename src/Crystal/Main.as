package Crystal
{
	import Crystal.Loader.Progressbar;
	import flash.display.Sprite;
	import flash.events.Event;
	import Crystal.Menu.StartMenu;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	 public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			/* Загрузка игры */
			this.addChild(new StartMenu());
			
		}
		
	}
	
}