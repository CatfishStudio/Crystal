package Crystal.Field 
{
	import flash.display.Sprite;
	import Crystal.Field.Field;
	import Crystal.Resource.Resource;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class PlayingField extends Sprite
	{
		/* Маска */
		private var spriteMask:Sprite = new Sprite();
		
		public function PlayingField()
		{
			Resource.FieldGame = new Field();
			/* Поле под маской */
			this.addChild(Resource.FieldGame);
			
			/* Маска */
			spriteMask.graphics.beginFill(0x333333, 1);
			spriteMask.graphics.drawRect(0, 0, 500, 500);
			spriteMask.graphics.endFill();
			spriteMask.x = 150; spriteMask.y = 75;
			addChild(spriteMask);
			
			/* Применяем Маску */
			(Resource.FieldGame as Field).mask = spriteMask;
		}
		
	}

}