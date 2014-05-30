package Crystal.Resource 
{
	import Crystal.Levels.Level1;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import Crystal.Units.Unit;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Resource 
	{
		/* Костанты */
		public static const COLUMNS:int = 10;
		public static const ROWS:int = 10;
		
		
		/* Загрузка картинки логотипа */
		[Embed(source = '../../../images/logo.png')]
		public static var Logo:Class;
		public static var LogoImage:Bitmap = new Logo();

		/* Картинка меню */
		[Embed(source = '../../../images/menu.png')]
		public static var MImage:Class;
		public static var MenuImage:Bitmap = new MImage();
		
		/* Картинка уровня */
		[Embed(source = '../../../images/level.png')]
		public static var LImage:Class;
		public static var LevelImage:Bitmap = new LImage();
		
		/* Кнопка "Старт" */
		[Embed(source = '../../../images/buttonStart_1.png')]
		public static var B1Image:Class;
		public static var Button1Image:Bitmap = new B1Image();
		[Embed(source = '../../../images/buttonStart_2.png')]
		public static var B2Image:Class;
		public static var Button2Image:Bitmap = new B2Image();
		
		/* Кнопка выход */
		[Embed(source = '../../../images/buttonExit_1.png')]
		public static var B3Image:Class;
		public static var Button3Image:Bitmap = new B3Image();
		[Embed(source = '../../../images/buttonExit_2.png')]
		public static var B4Image:Class;
		public static var Button4Image:Bitmap = new B4Image();
		
		/* Кристал */
		[Embed(source = '../../../images/crystal.png')]
		public static var CImage:Class;
		public static var CrystalImage:Bitmap = new CImage();
		
		/* Кристалы игрового поля */
		[Embed(source = '../../../images/crystal_1_50_50.png')]
		public static var C1Image:Class;
		[Embed(source = '../../../images/crystal_2_50_50.png')]
		public static var C2Image:Class;
		[Embed(source = '../../../images/crystal_3_50_50.png')]
		public static var C3Image:Class;
		[Embed(source = '../../../images/crystal_4_50_50.png')]
		public static var C4Image:Class;
		[Embed(source = '../../../images/crystal_5_50_50.png')]
		public static var C5Image:Class;
		
		/* Картинка анимации звёзд */
		[Embed(source = '../../../images/stars.png')]
		public static var StarsImage:Class;
		
		/* Массив (игровое поле) */
		public static var ArrayField:Array = []; // матрица игрового поля Array
		
		/* Блокировка игового поля */
		public static var BlockedField:Boolean = true; // по умолчанию заблокиронано
		
		/* Количество ходов */
		public static var NumberOfMoves:int = 25; // по умолчанию 25 ходов
		
		/* Количество собранных кристалов */
		public static var NumberOfCrystals:int = 0; // по умолчанию собрано 0
		
		public static var StartGame:Sprite;		// Родительский спрайт MAIN
		public static var Level:Sprite;			// родительский спрайт Level
		
		public function Resource() 
		{
			
		}
		
		
	}

}