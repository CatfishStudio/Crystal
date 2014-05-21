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
		/* Загрузка картинки логотипа */
		[Embed(source = '../../images/logo.png')]
		public static var Logo:Class;
		public static var LogoImage:Bitmap = new Logo();

		/* Картинка меню */
		[Embed(source = '../../images/menu.png')]
		public static var MImage:Class;
		public static var MenuImage:Bitmap = new MImage();
		
		/* Картинка уровня */
		[Embed(source = '../../images/level.png')]
		public static var LImage:Class;
		public static var LevelImage:Bitmap = new LImage();
		
		/* Кнопка "Старт" */
		[Embed(source = '../../images/buttonStart_1.png')]
		public static var B1Image:Class;
		public static var Button1Image:Bitmap = new B1Image();
		[Embed(source = '../../images/buttonStart_2.png')]
		public static var B2Image:Class;
		public static var Button2Image:Bitmap = new B2Image();
		
		/* Кристал */
		[Embed(source = '../../images/crystal.png')]
		public static var CImage:Class;
		public static var CrystalImage:Bitmap = new CImage();
		
		/* Кристалы игрового поля */
		[Embed(source = '../../images/crystal_1_50_50.png')]
		public static var C1Image:Class;
		public static var CrystalImage1:Bitmap = new C1Image();
		[Embed(source = '../../images/crystal_2_50_50.png')]
		public static var C2Image:Class;
		public static var CrystalImage2:Bitmap = new C2Image();
		[Embed(source = '../../images/crystal_3_50_50.png')]
		public static var C3Image:Class;
		public static var CrystalImage3:Bitmap = new C3Image();
		[Embed(source = '../../images/crystal_4_50_50.png')]
		public static var C4Image:Class;
		public static var CrystalImage4:Bitmap = new C4Image();
		[Embed(source = '../../images/crystal_5_50_50.png')]
		public static var C5Image:Class;
		public static var CrystalImage5:Bitmap = new C5Image();
		
		
		
		public function Resource() 
		{
			
		}
		
	}

}