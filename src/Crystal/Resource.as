package Crystal 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class Resource 
	{
		/* Загрузка фоновой картинки */
		[Embed(source = '../../images/menu.png')]
		public static var MImage:Class;
		public static var MenuImage:Bitmap = new MImage();
		
		public function Resource() 
		{
			
		}
		
	}

}