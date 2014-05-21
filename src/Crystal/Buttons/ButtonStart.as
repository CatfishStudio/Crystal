package Crystal.Buttons 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import Crystal.Resource;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class ButtonStart extends Sprite
	{
		
		public function ButtonStart() 
		{
			this.x = 40; this.y = 350;
			Resource.Button2Image.visible = false;
			this.addChild(Resource.Button1Image);
			this.addChild(Resource.Button2Image);
			
			/*события*/
			this.addEventListener(MouseEvent.CLICK, onMouseClickButton);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutButton);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButton);
		}
		
		/*События кнопки --------------------------------------------*/
		private function onMouseClickButton(e:MouseEvent):void
		{
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		private function onMouseOutButton(e:MouseEvent):void
		{
			Resource.Button1Image.visible = true;
			Resource.Button2Image.visible = false;
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		private function onMouseOverButton(e:MouseEvent):void
		{
			Resource.Button1Image.visible = false;
			Resource.Button2Image.visible = true;
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
	}

}