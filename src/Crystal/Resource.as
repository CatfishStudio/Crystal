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
		[Embed(source = '../../images/crystal_2_50_50.png')]
		public static var C2Image:Class;
		[Embed(source = '../../images/crystal_3_50_50.png')]
		public static var C3Image:Class;
		[Embed(source = '../../images/crystal_4_50_50.png')]
		public static var C4Image:Class;
		[Embed(source = '../../images/crystal_5_50_50.png')]
		public static var C5Image:Class;
		
		/* Картинка анимации звёзд */
		[Embed(source = '../../images/stars.png')]
		public static var StarsImage:Class;
		
		/* Массив (игровое поле) */
		//public static var VectorField:Vector.<Unit> = new Vector.<Unit>(); // матрица игрового поля Vector
		public static var ArrayField:Array = []; // матрица игрового поля Array
		
		
		public function Resource() 
		{
			
		}
		
		/* Создание ARRAY 2D массива типом спрайт */
		public static function CreateArray2D(n:int, m:int):Array
		{
			// i - столбец; j - строка
			var newArray:Array = [];
			for (var i:int = 0; i < n; i++) {
				var newRow:Array = [];
				for (var j:int = 0; j < m; j++) {
					var unitAdd:Unit = new Unit();
					unitAdd.IndexI = i; unitAdd.IndexJ = j;
					newRow.push(unitAdd);
				}
				newArray.push(newRow);
			}
			return newArray;
		}
		
		/* Создание VECTOR 2D массива типом спрайт */
		/*
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
		*/
		
		/* Случайный выбор */
		public static function RandomIndex():int
		{
			var indexRandom:Number = Math.random() * 10;
			var index:int = Math.round(indexRandom);
			if (index > 0 && index <= 2) return 1;
			if (index > 2 && index <= 4) return 2;
			if (index > 4 && index <= 6) return 3;
			if (index > 6 && index <= 8) return 4;
			if (index > 8 && index <= 10) return 5;
			return 1;
		}
		
		
	}

}