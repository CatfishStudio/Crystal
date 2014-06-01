package Crystal.Units 
{
	import Crystal.Levels.Panel;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import Crystal.Text.Label;
	import Crystal.Resource.Resource;
	import Crystal.Kernel.Mechanics;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class Unit extends Sprite
	{
		public var Index:int = Mechanics.RandomIndex(); // тип ячейки
		public var IndexI:int = 0; // положение обекта в массиве (по I столбец)
		public var IndexJ:int = 0; // положение обекта в массиве (по J строка)
		public var IndexY:int = 0; // координата объекта по Y
		public var Remove:Boolean = false; // флаг удаления кристала
		public var FieldParent:Sprite; // родительский спрайт (Игровое поле)
		
		private var iCrystal1:Bitmap = new Resource.C1Image(); // Кристал №1 сиренивый
		private var iCrystal2:Bitmap = new Resource.C2Image(); // Кристал №2 зеленый
		private var iCrystal3:Bitmap = new Resource.C3Image(); // Кристал №3 красный
		private var iCrystal4:Bitmap = new Resource.C4Image(); // Кристал №4 синий
		private var iCrystal5:Bitmap = new Resource.C5Image(); // Кристал №5 желтый
		
		private var click:Boolean = false; // флаг нажатия на кристал
		
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
			
			//trace("Создание экземпляра класса Unit");
		}
		
		/*События кнопки --------------------------------------------*/
		private function onMouseClick(e:MouseEvent):void
		{
			// при нажатии
			trace("ИНДЕКС(i-колонка):" + IndexI.toString() + "  ИНДЕКС(j-строка):" + IndexJ.toString());
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			click = true; // флаг - кристал нажат
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			click = false; // флаг - кристал не нажат
		}
		
		private function onMouseMove(e:MouseEvent):void
		{
			/* i - столбец; j - строка */
			
			if (click) {
				/* Смещение по горизонтале вправо */
				if (e.localX > 35 && e.localY < 35) {
					//if(this.IndexI < 9) Mechanics.ActionMove(this, Resource.ArrayField[this.IndexI + 1][this.IndexJ], "Right:I+1");
					//trace("Смещение по горизонтале вправо X > 45 и Y < 45");
					click = false;
				}
				/* Смещение по горизонтале влево */
				if (e.localX < 5 && e.localY > 5) {
					//if(this.IndexI > 0) Mechanics.ActionMove(this, Resource.ArrayField[this.IndexI - 1][this.IndexJ], "Left:I-1");
					//trace("Смещение по горизонтале влево X < 5 и Y > 5");
					click = false;
				}
				/* Смещение по вертикале вверх */
				if (e.localY < 5 && e.localX > 5) {
					//if(this.IndexJ > 0) Mechanics.ActionMove(this, Resource.ArrayField[this.IndexI][this.IndexJ - 1], "Up:J-1");
					//trace("Смещение по вертикале вверх Y < 5 и X > 5");
					click = false;
				}
				/* Смещение по вертикале вниз */
				if (e.localY > 35 && e.localX < 35) {
					//if(this.IndexJ < 9) Mechanics.ActionMove(this, Resource.ArrayField[this.IndexI][this.IndexJ + 1], "Down:J+1");
					//trace("Смещение по вертикале вниз Y > 45 и X < 45");
					click = false;
				}
			}
		}
		
		private function onMouseOut(e:MouseEvent):void
		{
			click = false;
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		private function onMouseOver(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
		
	}

}