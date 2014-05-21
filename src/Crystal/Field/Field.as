package Crystal.Field 
{
	import flash.display.Sprite;
	import Crystal.Resource;
	import Crystal.Units.Unit;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class Field extends Sprite
	{
		
		public function Field() 
		{
			this.x = 150; this.y = 75;
			this.graphics.beginFill(0x000000, 0.5);
			this.graphics.drawRect(0, 0, 500, 500);
			this.graphics.endFill();
			
			/* Заполнение матрицы игрового поля */
			Resource.arrayField = Resource.CreateArray2D(10, 10, Unit);
			
		}
		
	}

}