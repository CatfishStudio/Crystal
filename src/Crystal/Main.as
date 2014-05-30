package Crystal
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Crystal.Menu.StartMenu;
	import Crystal.Levels.Level1
	import Crystal.Resource.Resource;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class Main extends Sprite 
	{
		private var sMenu:StartMenu;
		private var level:Level1;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			Resource.StartGame = this; // глобальная ссылка
			
			/* Главное меню игры */
			sMenu = new StartMenu();
			sMenu.addEventListener(Event.CHANGE, onChangeStart);
			this.addChild(sMenu);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
		private function onChangeStart(e:Event):void 
		{
			level = new Level1();
			this.removeChild(sMenu);
			this.addChild(level);
		}
		
		public function NewGame():void
		{
			this.removeChild(level);
			/* Главное меню игры */
			sMenu = new StartMenu();
			sMenu.addEventListener(Event.CHANGE, onChangeStart);
			this.addChild(sMenu);
		}
	}
	
}