package Crystal.Levels 
{
	import Crystal.Buttons.ButtonExit;
	import Crystal.Windows.Mission;
	import flash.display.Sprite;
	import Crystal.Resource.Resource;
	import Crystal.Field.Grid;
	import Crystal.Field.PlayingField;
		
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Level1 extends Sprite
	{
		
		public function Level1() 
		{
			Resource.Level = this;
			this.addChild(Resource.LevelImage);	// фоновая картинка уровня
			this.addChild(new Grid()); 			// создание сетки
			this.addChild(new PlayingField());	// создание игрового поля
			Resource.LevelPanel = new Panel();	// создание игровой панели
			this.addChild(Resource.LevelPanel);	// 
			this.addChild(new ButtonExit());	// кнопка выхода с уровня
			this.addChild(new Mission()); 		// окно описания задания на уровне
		}
		
	}

}