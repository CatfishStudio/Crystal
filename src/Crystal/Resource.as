package Crystal 
{
	import Crystal.Units.Unit;
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
		
		
		public static var vectorField:Vector.<Unit> = new Vector.<Unit>(); // матрица игрового поля
		public static var arrayField:Array = [];
		
		
		public function Resource() 
		{
			
		}
		
		/* Создание ARRAY 2D массива типом спрайт */
		public static function CreateArray2D(n:int, m:int, MySprite:Class):Array
		{

			var newArray:Array = [];
			for (var i:int = 0; i < n; i++) {
				var newRow:Array = [];
				for (var j:int = 0; j < m; j++) {
					var spriteAdd:Sprite = new MySprite();
					newRow.push(spriteAdd);
				}
				newArray.push(newRow);
			}
			return newArray;
		}
		
		/* Создание VECTOR 2D массива типом спрайт */
		public static function CreateVector2D(n:int, m:int, MySprite:Class):Vector.<Unit>
		{
			var newVector:Vector.<Unit> = new Vector.<Unit>();
			for (var i:int = 0; i < n; i++) {
				var newRow:Vector.<Unit> = new Vector.<Unit>();
				for (var j:int = 0; j < m; j++) {
					var spriteAdd:Sprite = new MySprite();
					newRow.push(spriteAdd);
				}
				newVector.push(newRow);
			}
			return newVector;
		}
		
	}

}