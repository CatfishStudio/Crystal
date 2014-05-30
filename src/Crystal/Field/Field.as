package Crystal.Field 
{
	import flash.display.Sprite;
	import Crystal.Units.Unit;
	import Crystal.Text.Label;
	import Crystal.Resource.Resource;
	import Crystal.Kernel.Mechanics;
	import Crystal.Windows.Mission;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	 public class Field extends Sprite
	{
		
		public function Field() 
		{
			this.x = 150; this.y = 75;
			this.graphics.beginFill(0x000000, 0.1);
			this.graphics.drawRect(0, 0, 500, 500);
			this.graphics.endFill();
			
			/* Заполнение матрицы игрового поля кристалами */
			Resource.ArrayField = Mechanics.CreateArrayUnits2D();
			/* Показать кристалы на игровом поле */
			Mechanics.ShowUnits(this);
		
		}
		
		
		
		
	}

}