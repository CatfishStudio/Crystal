package Crystal.Kernel 
{
	import flash.display.Sprite;
	import Crystal.Units.Unit;
	import Crystal.Resource.Resource;
	import Crystal.Animation.Stars;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class Mechanics 
	{
		
		public function Mechanics() 
		{
			
		}
		
		/* Случайный число */
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
		
		/* Создание ARRAY 2D массива типом спрайт */
		public static function CreateArrayUnits2D():Array
		{
			// i - столбец; j - строка
			var newArray:Array = [];
			for (var i:int = 0; i < Resource.COLUMNS; i++) {
				var newRow:Array = [];
				for (var j:int = 0; j < Resource.ROWS; j++) {
					var unitAdd:Unit = new Unit();
					unitAdd.IndexI = i; unitAdd.IndexJ = j;
					newRow.push(unitAdd);
				}
				newArray.push(newRow);
			}
			return newArray;
		}
		
		/* Отображение кристалов на игровом поле */
		public static function ShowUnits(fieldParent:Sprite)
		{
			for (var i:int = 0; i < Resource.COLUMNS; i++) { 	// СТОЛБЕЦ (i)
				for (var j:int = 0; j < Resource.ROWS; j++) { 	// СТРОКА (j)
					Resource.ArrayField[i][j].x = 50 * i;
					Resource.ArrayField[i][j].y = 50 * j;
					Resource.ArrayField[i][j].FieldParent = fieldParent; // Кристал получает ссылку на родительский спрайт (игровое поле)
					////////////Resource.ArrayField[i][j].addChild(new Label(10, 10, 50, 50, "System", 16, 0x000000, "i" + Resource.ArrayField[i][j].IndexI.toString() + ":j" + Resource.ArrayField[i][j].IndexJ.toString()));
					fieldParent.addChild(Resource.ArrayField[i][j]);
				}
			}
		}
				
		/* Проверка строка (3-и и более в ряд) */
		public static function CheckRow(row:int):Boolean
		{
			var resultCheck:Boolean = false;
			/* просматриваем кристалы в строке (по столбцам) */
			for (var i:int = 0; i < Resource.COLUMNS; i++) {
				if (i < 8) {
					/* Группа из 3-х кристалов */
					if (Resource.ArrayField[i][row].Index == Resource.ArrayField[i + 1][row].Index && Resource.ArrayField[i][row].Index == Resource.ArrayField[i + 2][row].Index) {
						/*Отмечаем кристалы для удаления */
						resultCheck = true;
						Resource.ArrayField[i][row].Remove = true;
						Resource.ArrayField[i + 1][row].Remove = true;
						Resource.ArrayField[i + 2][row].Remove = true;
						
						Resource.ArrayField[i][row].alpha = 0.2;
						Resource.ArrayField[i + 1][row].alpha = 0.2;
						Resource.ArrayField[i + 2][row].alpha = 0.2;

						/* Группа из 4-х кристалов */
						if (i < 7) {
							if (Resource.ArrayField[i][row].Index == Resource.ArrayField[i + 3][row].Index) {
								/*Отмечаем кристалы для удаления */
								Resource.ArrayField[i + 3][row].Remove = true;
								
								Resource.ArrayField[i + 3][row].alpha = 0.2;
								
								/* Группа из 5-ти кристалов */
								if (i < 6) {
									if (Resource.ArrayField[i][row].Index == Resource.ArrayField[i + 4][row].Index) {
										/*Отмечаем кристалы для удаления */
										Resource.ArrayField[i + 4][row].Remove = true;
										
										Resource.ArrayField[i + 4][row].alpha = 0.2;
									}
								}
							}
						}
					}
				}else break;
			}
			return resultCheck;
		}

		/* Проверка колонки (3-и и более в ряд) */
		public static function CheckColumn(column:int):Boolean
		{
			var resultCheck:Boolean = false;
			/* просматриваем кристалы в столбце (по строкам) */
			for (var j:int = 0; j < Resource.COLUMNS; j++) {
				if (j < 8) {
					/* Группа из 3-х кристалов */
					if (Resource.ArrayField[column][j].Index == Resource.ArrayField[column][j + 1].Index && Resource.ArrayField[column][j].Index == Resource.ArrayField[column][j + 2].Index) {
						/*Отмечаем кристалы для удаления */
						resultCheck = true;
						Resource.ArrayField[column][j].Remove = true;
						Resource.ArrayField[column][j + 1].Remove = true;
						Resource.ArrayField[column][j + 2].Remove = true;
						
						Resource.ArrayField[column][j].alpha = 0.2;
						Resource.ArrayField[column][j + 1].alpha = 0.2;
						Resource.ArrayField[column][j + 2].alpha = 0.2;

						/* Группа из 4-х кристалов */
						if (j < 7) {
							if (Resource.ArrayField[column][j].Index == Resource.ArrayField[column][j + 3].Index) {
								/*Отмечаем кристалы для удаления */
								Resource.ArrayField[column][j + 3].Remove = true;
								
								Resource.ArrayField[column][j + 3].alpha = 0.2;

								/* Группа из 5-ти кристалов */
								if (j < 6) {
									if (Resource.ArrayField[column][j].Index == Resource.ArrayField[column][j + 4].Index) {
										/*Отмечаем кристалы для удаления */
										Resource.ArrayField[column][j + 4].Remove = true;
										
										Resource.ArrayField[column][j + 4].alpha = 0.2;
									}
								}
							}
						}
					}
				}else break;
			}
			return resultCheck;
		}

		/* Общая проверка колонок и строк (3-и и более в ряд) */
		public static function CheckField():Boolean
		{
			var resultCheck:Boolean = false;
			/* i - столбец; j - строка */
			for (var i:int = 0; i < Resource.COLUMNS; i++) {
				if (CheckColumn(i) == true) resultCheck = true;
				for (var j:int = 0; j < Resource.ROWS; j++) {
					if (CheckRow(j) == true) resultCheck = true;
				}
			}
			return resultCheck;
		}
		
		/* Механика: Удаление на поле всех отмеченных ячеек */
		public static function Remove(fieldParent:Sprite):Boolean
		{
			var resultCheck:Boolean = false;
			
			for (var i:int = 0; i < Resource.COLUMNS; i++) { 		/* i - столбецы (обработка слева на право) */
				var arrayCrystal:Array = [];
				
				/* Удаление помеченных кристалов */
				for (var j1:int = 9; j1 >= 0; j1--) {
					if (Resource.ArrayField[i][j1].Remove == true) { /* УДАЛЯЕМ */
						/* Анимация звёзд */
						fieldParent.addChild(new Stars(Resource.ArrayField[i][j1].x, Resource.ArrayField[i][j1].y, fieldParent));
						/* Удаление кристала с поля */
						fieldParent.removeChild(Resource.ArrayField[i][j1]);
						/* Удаляем в массиве */
						Resource.ArrayField[i].pop(); // Удаляем из массива
						/* Увеличиваем общее число удалённых кристалов */
						Resource.NumberOfCrystals++;
						/* Определяем возвращаемое значение данной функцией */
						resultCheck = true;
					}else { /* НЕ УДАЛЯЕМ */
						/* Сохраняем кристал в промежуточный массив */
						arrayCrystal.push(Resource.ArrayField[i][j1]);
						/* Удаляем в массиве */
						Resource.ArrayField[i].pop(); // Удаляем из массива
					}
				}
				
				/* Возвращаем оставщиеся кристалы в массив игрового поля и добавляем новые */
				for (var j2:int = 9; j2 >= 0; j2--) {
					if (arrayCrystal[j2] != undefined) {
						/* Перемещение кристала в массиве */
						Resource.ArrayField[i].push(arrayCrystal[j2]); // Переносим (добавляем) в массив
					}else {
						/* Добавление новых кристалов на поле */
						var unitAdd:Unit = new Unit();
						unitAdd.IndexI = i; unitAdd.IndexJ = j2 - 10;
						unitAdd.x = 50 * i; unitAdd.y = 0;
						unitAdd.alpha = 0.1;
						Resource.ArrayField[i].push(unitAdd); // добавляем новый кристал в массив
						fieldParent.addChild(unitAdd);	// добавляем новый кристал на поле (спрайт)
					}
				}
			}
			return resultCheck;
		}
		
		
	}

}