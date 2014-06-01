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
		
		/* Панельки */
		private var panelMove:Sprite = new Sprite();	// панель ходов
		private var panelTask:Sprite = new Sprite();	// панель задания
		
		/* Количество ходов */
		public var NumberOfMoves:int = 25; // по умолчанию 25 ходов
		private var LabelMove:Label;
		
		/* Количество собранных кристалов */
		public var NumberOfCrystals:int = 0; // по умолчанию собрано 0
		private var LabelCrystal:Label;
		
		/*
		 * Для обращения использовать следующие методы
		 * (Resource.LevelPanel as Panel).ReductionMoves();
		 * (Resource.LevelPanel as Panel).IncreasingNumberCrystals();
		 * 
		 * */
		
		public function Panel() 
		{
			this.x = 0; this.y = 0;
			this.alpha = 1;
			
			/* Панель: задания */
			panelTask.graphics.lineStyle(1, 0xcccccc, 1);
			panelTask.graphics.beginFill(0x800080, 1); //0x5E7597
			panelTask.graphics.drawRect(130, 25, 230, 30);
			panelTask.graphics.endFill();
			panelTask.alpha = 0.3;
			this.addChild(panelTask);
			LabelCrystal = new Label(155, 30, 230, 30, "Times New Roman", 16, 0xFFFFFF, "Кристалов собрано " + NumberOfCrystals.toString() + " / 100");
			this.addChild(LabelCrystal);
			
			/* Панель: осталось ходов */
			panelMove.graphics.lineStyle(1, 0xcccccc, 1);
			panelMove.graphics.beginFill(0x800080, 1);//0x800080
			panelMove.graphics.drawRect(25, 30, 100, 60);
			panelMove.graphics.endFill();
			panelMove.alpha = 0.3;
			this.addChild(panelMove);
			LabelMove = new Label(40, 63, 100, 30, "Times New Roman", 16, 0xFFFFFF, "Ходов: " + NumberOfMoves.toString());
			this.addChild(LabelMove);
		
			iCrystal1.x = 0; iCrystal1.y = 15;
			this.addChild(iCrystal1);
			iCrystal2.x = 25; iCrystal2.y = 15;
			this.addChild(iCrystal2);
			iCrystal3.x = 50; iCrystal3.y = 15;
			this.addChild(iCrystal3);
			iCrystal4.x = 75; iCrystal4.y = 15;
			this.addChild(iCrystal4);
			iCrystal5.x = 100; iCrystal5.y = 15;
			this.addChild(iCrystal5);
		}
		
		/* Сокращение ходов */
		public function ReductionMoves():void
		{
			NumberOfMoves--;
			LabelMove.text = "Ходов: " + NumberOfMoves.toString();
		}
		
		/* Увеличение количества кристалов */
		public function IncreasingNumberCrystals():void
		{
			NumberOfCrystals++;
			LabelCrystal.text = "Кристалов собрано " + NumberOfCrystals.toString() + " / 100";
		}
	}

}