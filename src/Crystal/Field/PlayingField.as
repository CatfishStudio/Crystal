package Crystal.Field 
{
	import flash.display.Sprite;
	import Crystal.Field.Field;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class PlayingField extends Sprite
	{
		/* Маска */
		private var spriteMask:Sprite = new Sprite();
		/* Поле */
		private var field:Field = new Field();
		
		public function PlayingField() 
		{
			/* Поле под маской */
			this.addChild(field);
			
			/* Маска */
			spriteMask.graphics.beginFill(0x333333, 1);
			spriteMask.graphics.drawRect(0, 0, 500, 500);
			spriteMask.graphics.endFill();
			spriteMask.x = 150; spriteMask.y = 75;
			addChild(spriteMask);
			
			/* Применяем Маску */
			field.mask = spriteMask;
			
			trace("Создание экземпляра класса PlayingField");
		}
		
	}

}