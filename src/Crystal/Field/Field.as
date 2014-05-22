package Crystal.Field 
{
	import flash.display.Sprite;
	import Crystal.Resource;
	import Crystal.Units.Unit;
	import Crystal.Text.Label;
	
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
			Resource.ArrayField = Resource.CreateArray2D(10, 10);
			/* Показать кристалы на игровом поле */
			ShowUnits(10, 10);
			
			trace("Создание экземпляра класса Field");
		}
		
		/* Заполнение матрици кристалами */
		
		/* Отображение кристалов на игровом поле */
		private function ShowUnits(n:int, m:int)
		{
			// i - столбец; j - строка
			for (var i:int = 0; i < n; i++) {
				for (var j:int = 0; j < m; j++) {
					Resource.ArrayField[i][j].x = 50 * i;
					Resource.ArrayField[i][j].y = 50 * j;
					Resource.ArrayField[i][j].addChild(new Label(10, 10, 50, 50, "System", 16, 0x000000, "i" + Resource.ArrayField[i][j].IndexI.toString() + ":j" + Resource.ArrayField[i][j].IndexJ.toString()));
					this.addChild(Resource.ArrayField[i][j]);
				}
			}
			trace("Отображение кристалов на игровом поле");
		}
		
	}

}