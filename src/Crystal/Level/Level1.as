package Crystal.Level 
{
	import Crystal.Field.Grid;
	import Crystal.Field.PlayingField;
	import flash.display.Sprite;
	import flash.events.Event;
	import Crystal.Resource;
	import Crystal.Buttons.ButtonStart;
	import Crystal.Menu.Logo;
	import Crystal.Text.Label;
	import Crystal.Field.Grid;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class Level1 extends Sprite
	{
		
		public function Level1() 
		{
			this.addChild(Resource.LevelImage);
			this.addChild(new Grid());
			this.addChild(new PlayingField());
			
			trace("Создание экземпляра класса Level1 (уровень1)");
		}
	
	}

}