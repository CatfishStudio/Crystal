package Crystal.Loader 
{
	import Crystal.Menu.StartMenu;
	import flash.display.Sprite;
	import flash.events.Event;
		
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
		
	public class Progressbar extends Sprite
	{
		
		private var w:uint = 200; // ширина прелоадера 
		private var h:uint = 10; // высота прелоадера 
		private var colorFon:uint = 0xcccccc; // цвет фона прелоадера 
		private var color:uint = 0x333333; // цвет индикатора загрузки 
		
		var band:Sprite = new Sprite(); //индикатор загрузки
		
		public function Progressbar(width:int, height:int) 
		{
			/* рисуем контейнер прелоадера */
			this.graphics.lineStyle(1, color, 1);
			this.graphics.beginFill(colorFon, 1);
			this.graphics.drawRect(0, 0, w, h);
			this.graphics.endFill();
			
			/* помещаем прелоадер на середину флеш-ролика */
			this.x = (width - w) / 2; 
			this.y = (height - h) / 2; 
			
			/* рисуем индикатор загрузки */
			band.graphics.beginFill(color, 1); 
			band.graphics.drawRect(0, 0, 5, h); 
			band.graphics.endFill();
			this.addChild(band);
			
			load();
		}
		
		private function load()
		{
			band.scaleX = 10;
		}
		
	}

}