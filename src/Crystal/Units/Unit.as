package Crystal.Units 
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
	
	public class Unit extends Sprite
	{
		public var Index:int = Resource.RandomIndex(); // тип ячейки
		public var IndexI:int = 0; // положение обекта в массиве (по I)
		public var IndexJ:int = 0; // положение обекта в массиве (по J)
		
		private var iCrystal1:Bitmap = new Resource.C1Image();
		private var iCrystal2:Bitmap = new Resource.C2Image();
		private var iCrystal3:Bitmap = new Resource.C3Image();
		private var iCrystal4:Bitmap = new Resource.C4Image();
		private var iCrystal5:Bitmap = new Resource.C5Image();
		
		private var click:Boolean = false; // флаг нажатия на кристал
		private var cursorX:int = 0; // Положение курсора над кресталом по X
		private var cursorY:int = 0; // Положение курсора над кресталом по Y
			
		
		public function Unit() 
		{
			if (Index == 1) this.addChild(iCrystal1);
			if (Index == 2) this.addChild(iCrystal2);
			if (Index == 3) this.addChild(iCrystal3);
			if (Index == 4) this.addChild(iCrystal4);
			if (Index == 5) this.addChild(iCrystal5);
			
			/*события*/
			this.addEventListener(MouseEvent.CLICK, onMouseClick);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			
			trace("Создание экземпляра класса Unit");
		}
		
		/*События кнопки --------------------------------------------*/
		private function onMouseClick(e:MouseEvent):void
		{
			// при нажатии
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			cursorX = e.localX; cursorY = e.localY;
			click = true; // флаг - кристал нажат
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			cursorX = 0; cursorY = 0;
			click = false; // флаг - кристал не нажат
		}
		
		private function onMouseMove(e:MouseEvent):void
		{
			if (click) {
				
			}
		}
		
		private function onMouseOut(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		private function onMouseOver(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.BUTTON;
		}
	}

}