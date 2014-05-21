package Crystal.Level 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Crystal.Resource;
	import Crystal.Buttons.ButtonStart;
	import Crystal.Menu.Logo;
	import Crystal.Text.Label;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class Level1 extends Sprite
	{
		
		public function Level1() 
		{
			this.addChild(Resource.LevelImage);
			CreateField();
		}
		
		/* построение игрового поля */
		private function CreateField():void
		{
			
		}
	
	}

}