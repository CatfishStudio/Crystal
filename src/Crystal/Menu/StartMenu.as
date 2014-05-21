package Crystal.Menu 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Crystal.Resource;
	import Crystal.Buttons.ButtonStart;
	import Crystal.Menu.Logo;
	import Crystal.Text.Label;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class StartMenu extends Sprite
	{
		private var bStart:ButtonStart;
		
		public function StartMenu() 
		{
			this.addChild(Resource.MenuImage);
			bStart = new ButtonStart();
			bStart.addEventListener(Event.CHANGE, onChangeStart);
			this.addChild(bStart);
			this.addChild(new Logo(5, 545));
			this.addChild(new Label(60, 560, 400, 50, "System", 16, 0xFFFFFF, "<b>© Catfish Studio. 2014 Copyright. All rights reserved.<b>"));
		}
		
		private function onChangeStart(e:Event):void 
		{
			dispatchEvent(new Event(Event.CHANGE));
		}
		
	}

}