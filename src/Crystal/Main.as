package Crystal
{
	import Crystal.Level.Level1;
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
		private var sMenu:StartMenu;
		private var level1:Level1;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			/* Главное меню игры */
			sMenu = new StartMenu();
			sMenu.addEventListener(Event.CHANGE, onChangeStart);
			this.addChild(sMenu);
			
		}
		
		
		private function onChangeStart(e:Event):void 
		{
			level1 = new Level1();
			//level1.addEventListener(Event.CHANGE, onChangeStart);
			this.removeChild(sMenu);
			this.addChild(level1);
		}
		
	}
	
}