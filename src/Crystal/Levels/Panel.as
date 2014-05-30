package Crystal.Levels 
{
	import flash.display.Sprite;
	import Crystal.Text.Label;
	import Crystal.Resource.Resource;
		
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Panel extends Sprite
	{
		
		public function Panel() 
		{
			this.x = 0; this.y = 0;
			this.alpha = 0.5;
			
			this.graphics.lineStyle(1, 0xcccccc, 1);
			this.graphics.beginFill(0x5E7597, 1);
			this.graphics.drawRect(10, 35, 230, 30);
			this.graphics.endFill();
			this.addChild(new Label(20, 40, 230, 30, "Times New Roman", 16, 0xFFFFFF, "Кристалов собрано " + Resource.NumberOfCrystals.toString() + "/100"));
			
			this.graphics.lineStyle(1, 0xcccccc, 1);
			this.graphics.beginFill(0x5E7597, 1);
			this.graphics.drawRect(10, 75, 130, 30);
			this.graphics.endFill();
			this.addChild(new Label(20, 80, 130, 30, "Times New Roman", 16, 0xFFFFFF, "Ходов: " + Resource.NumberOfMoves.toString()));
			
		}
		
	}

}