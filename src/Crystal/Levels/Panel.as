package Crystal.Levels 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import Crystal.Text.Label;
	import Crystal.Resource.Resource;
		
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Panel extends Sprite
	{
		private var iCrystal1:Bitmap = new Resource.C1Image(); // Кристал №1 сиренивый
		private var iCrystal2:Bitmap = new Resource.C2Image(); // Кристал №2 зеленый
		private var iCrystal3:Bitmap = new Resource.C3Image(); // Кристал №3 красный
		private var iCrystal4:Bitmap = new Resource.C4Image(); // Кристал №4 синий
		private var iCrystal5:Bitmap = new Resource.C5Image(); // Кристал №5 желтый
		
		public function Panel() 
		{
			this.x = 0; this.y = 0;
			this.alpha = 0.8;
			
			this.graphics.lineStyle(1, 0xcccccc, 1);
			this.graphics.beginFill(0x5E7597, 1);
			this.graphics.drawRect(150, 35, 230, 30);
			this.graphics.endFill();
			
			iCrystal1.x = 0; iCrystal1.y = 25;
			this.addChild(iCrystal1);
			iCrystal2.x = 25; iCrystal2.y = 25;
			this.addChild(iCrystal2);
			iCrystal3.x = 50; iCrystal3.y = 25;
			this.addChild(iCrystal3);
			iCrystal4.x = 75; iCrystal4.y = 25;
			this.addChild(iCrystal4);
			iCrystal5.x = 100; iCrystal5.y = 25;
			this.addChild(iCrystal5);
			
			Resource.MovesPanelText = new Label(160, 40, 230, 30, "Times New Roman", 16, 0xFFFFFF, "Кристалов собрано " + Resource.NumberOfCrystals.toString() + "/100");
			this.addChild(Resource.MovesPanelText);
			
			this.graphics.lineStyle(1, 0xcccccc, 1);
			this.graphics.beginFill(0x800080, 1);
			this.graphics.drawRect(10, 75, 130, 30);
			this.graphics.endFill();
			this.addChild(new Label(20, 80, 130, 30, "Times New Roman", 16, 0xFFFFFF, "Ходов: " + Resource.NumberOfMoves.toString()));
			
		}
		
	}

}