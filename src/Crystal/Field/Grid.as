package Crystal.Field 
{
	import flash.display.Sprite;
	import Crystal.Resource.Resource;
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class Grid extends Sprite
	{
		
		public function Grid() 
		{
			this.x = 150; this.y = 75;
			for (var i:int = 1; i < Resource.COLUMNS; i++) {
				for (var j:int = 1; j < Resource.ROWS; j++) {
					this.graphics.lineStyle(1, 0xcccccc, 1);
					this.graphics.beginFill(0xcccccc, 1);
					this.graphics.moveTo(i * 50, 0);
					this.graphics.lineTo(i * 50, 495);
					this.graphics.moveTo(0, j * 50);
					this.graphics.lineTo(495, j * 50);
					this.graphics.endFill();
				}
			}
		}
		
	}

}