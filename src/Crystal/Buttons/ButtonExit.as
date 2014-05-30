package Crystal.Buttons 
{
	import Crystal.Levels.Level1;
	import Crystal.Main;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import Crystal.Resource.Resource;
	import Crystal.Windows.Completed;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class ButtonExit extends Sprite
	{
		
		public function ButtonExit() 
		{
			this.x = 650; this.y = 550;
			this.scaleX -= 0.3; this.scaleY -= 0.3;
			Resource.Button4Image.visible = false;
			Resource.Button3Image.smoothing = true;
			Resource.Button4Image.smoothing = true;
			
			this.addChild(Resource.Button3Image);
			this.addChild(Resource.Button4Image);
			
			/*события*/
			this.addEventListener(MouseEvent.CLICK, onMouseClickButton);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutButton);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButton);
		}
		
		/*События кнопки --------------------------------------------*/
		private function onMouseClickButton(e:MouseEvent):void
		{
			(Resource.Level as Level1).addChild(new Completed("Уровень проигран!"));
		}
		
		private function onMouseOutButton(e:MouseEvent):void
		{
			Resource.Button3Image.visible = true;
			Resource.Button4Image.visible = false;
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		private function onMouseOverButton(e:MouseEvent):void
		{
			Resource.Button3Image.visible = false;
			Resource.Button4Image.visible = true;
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
	}

}