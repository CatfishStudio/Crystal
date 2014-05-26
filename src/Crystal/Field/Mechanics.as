package Crystal.Field 
{
	import Crystal.Units.Unit;
	import Crystal.Animation.BackMove;
	import Crystal.Animation.ExchangeMove;
	import Crystal.Animation.DownMove;
	import Crystal.Resource;
	import Crystal.Animation.Stars;
	import Crystal.Text.Label;
	import flash.display.Sprite;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class Mechanics 
	{
		
				
		/* Механика: Пользователь сделал ход */
		public static function ActionMove(crystal1:Unit, crystal2:Unit, destination:String)
		{
			var eMove:ExchangeMove;
			var bMove:BackMove;
			/* Обмен кристалов местами в массиве */
			ExchangeCrystals(crystal1, crystal2); // обмен кристалов местами
			
			if (CheckRow(Resource.ArrayField[crystal1.IndexI][crystal1.IndexJ].IndexJ) == true || CheckColumn(Resource.ArrayField[crystal1.IndexI][crystal1.IndexJ].IndexI) == true) {
				/* 1-й кристал собран в группу
				 * Выполняем обработку 2-го кристала */
				CheckRow(Resource.ArrayField[crystal2.IndexI][crystal2.IndexJ].IndexJ); 
				CheckColumn(Resource.ArrayField[crystal2.IndexI][crystal2.IndexJ].IndexI);
				/* Анимация */
				eMove = new ExchangeMove(crystal1, crystal2, destination);
			
				/* Производим удаление кристалов */
				Remove(crystal1.FieldParent);
				
			}else {
				/* 1-й кристал НЕ собран в группу
				 * Выполняем проверку 2-го кристала */
				if (CheckRow(Resource.ArrayField[crystal2.IndexI][crystal2.IndexJ].IndexJ) == true || CheckColumn(Resource.ArrayField[crystal2.IndexI][crystal2.IndexJ].IndexI) == true) {
					/* 2-й кристал собран в группу */
					
					/* Анимация */
					eMove = new ExchangeMove(crystal1, crystal2, destination);
					/* Производим удаление кристалов */
					Remove(crystal2.FieldParent);
					
				} else {
					/* Оба кристала не вошли в группу */
					ExchangeCrystals(crystal2, crystal1); // обратный обмен кристалов местами
					bMove = new BackMove(crystal1, crystal2, destination);
					
				}
			}
			
			trace("Механика: Пользователь сделал ход");
		}
		
		/* Механика: Обмен в массиве выбранных пользователем кристалов местами */
		public static function ExchangeCrystals(crystal1:Unit, crystal2:Unit)
		{
			var crystal:Unit = new Unit();
			crystal = crystal1;
			Resource.ArrayField[crystal1.IndexI][crystal1.IndexJ] = crystal2;
			Resource.ArrayField[crystal2.IndexI][crystal2.IndexJ] = crystal;
			
			trace("Механика: Обмен кристалов местами");
		}
		
		/* Механика: Проверка строки */
		public static function CheckRow(row:int):Boolean
		{
			var resultCheck:Boolean = false;
			/* просматриваем кристалы в строке (по столбцам) */
			for (var i:int = 0; i < 10; i++) {
				if (i < 7) {
					/* Группа из 3-х кристалов */
					if (Resource.ArrayField[i][row].Index == Resource.ArrayField[i + 1][row].Index && Resource.ArrayField[i][row].Index == Resource.ArrayField[i + 2][row].Index) {
						/*Отмечаем кристалы для удаления */
						resultCheck = true;
						Resource.ArrayField[i][row].Remove = true;
						Resource.ArrayField[i + 1][row].Remove = true;
						Resource.ArrayField[i + 2][row].Remove = true;
						
						/* Группа из 4-х кристалов */
						if (i < 6) {
							if (Resource.ArrayField[i][row].Index == Resource.ArrayField[i + 3][row].Index) {
								/*Отмечаем кристалы для удаления */
								Resource.ArrayField[i + 3][row].Remove = true;
						
								/* Группа из 5-ти кристалов */
								if (i < 5) {
									if (Resource.ArrayField[i][row].Index == Resource.ArrayField[i + 4][row].Index) {
										/*Отмечаем кристалы для удаления */
										Resource.ArrayField[i + 4][row].Remove = true;
									}
								}
							}
						}
					}
				}else break;
			}
			trace("Механика: Проверка строки : " + row.toString());
			return resultCheck;
		}
		
		/* Механика: Проверка Столбца */
		public static function CheckColumn(column:int):Boolean
		{
			var resultCheck:Boolean = false;
			/* просматриваем кристалы в столбце (по строкам) */
			for (var j:int = 0; j < 10; j++) {
				if (j < 7) {
					/* Группа из 3-х кристалов */
					if (Resource.ArrayField[column][j].Index == Resource.ArrayField[column][j + 1].Index && Resource.ArrayField[column][j].Index == Resource.ArrayField[column][j + 2].Index) {
						/*Отмечаем кристалы для удаления */
						resultCheck = true;
						Resource.ArrayField[column][j].Remove = true;
						Resource.ArrayField[column][j + 1].Remove = true;
						Resource.ArrayField[column][j + 2].Remove = true;
						
						/* Группа из 4-х кристалов */
						if (j < 6) {
							if (Resource.ArrayField[column][j].Index == Resource.ArrayField[column][j + 3].Index) {
								/*Отмечаем кристалы для удаления */
								Resource.ArrayField[column][j + 3].Remove = true;
						
								/* Группа из 5-ти кристалов */
								if (j < 5) {
									if (Resource.ArrayField[column][j].Index == Resource.ArrayField[column][j + 4].Index) {
										/*Отмечаем кристалы для удаления */
										Resource.ArrayField[column][j + 4].Remove = true;
									}
								}
							}
						}
					}
				}else break;
			}
			trace("Механика: Проверка столбца : " + column.toString());
			return resultCheck;
		}
		
		/* Механика: Проверка всего поля */
		public static function CheckField():Boolean
		{
			var resultCheck:Boolean = false;
			/* i - столбец; j - строка */
			for (var i:int = 0; i < 10; i++) {
				if (CheckColumn(i) == true) resultCheck = true;
				for (var j:int = 0; j < 10; j++) {
					if (CheckRow(j) == true) resultCheck = true;
				}
			}
			
			trace("Механика: Проверка всего поля");
			return resultCheck;
		}
		
		/* Механика: Удаление на поле всех отмеченных ячеек */
		public static function Remove(fieldParent:Sprite)
		{
						
			for (var i:int = 0; i < 10; i++) { 		/* i - столбец (обработка слева на право) */
			
				/* Удаление помеченных кристалов */
				var arrayCrystal:Array = [];
				for (var j1:int = 9; j1 >= 0; j1--) {
					if (Resource.ArrayField[i][j1].Remove == true) { /* УДАЛЯЕМ */
						/* Анимация звёзд */
						fieldParent.addChild(new Stars(Resource.ArrayField[i][j1].x, Resource.ArrayField[i][j1].y, fieldParent));
						/* Удаление кристала с поля */
						fieldParent.removeChild(Resource.ArrayField[i][j1]);
						/* Удаляем в массиве */
						Resource.ArrayField[i].pop(); // Удаляем из массива
					}else { /* НЕ УДАЛЯЕМ */
						/* Сохраняем кристал в промежуточный массив */
						arrayCrystal.push(Resource.ArrayField[i][j1]);
						/* Удаляем в массиве */
						Resource.ArrayField[i].pop(); // Удаляем из массива
					}
				}
				
				/* Возвращаем оставщиеся кристалы в массив игрового поля */
				for (var j2:int = 9; j2 >= 0; j2--) {
					if (arrayCrystal[j2] != undefined) {
						/* Перемещение кристала в массиве */
						//arrayCrystal[j2].IndexI = i; arrayCrystal[j2].IndexJ = j2;
						Resource.ArrayField[i].push(arrayCrystal[j2]); // Переносим (добавляем) в массив
					}else {
						/* Добавление новых кристалов на поле */
						var unitAdd:Unit = new Unit();
						unitAdd.IndexI = i; unitAdd.IndexJ = j2 - 10;
						unitAdd.x = 50 * i; unitAdd.y = -50; //50 * (j2 - 10);
						///////////unitAdd.addChild(new Label(10, 10, 50, 50, "System", 16, 0x000000, "i" + i.toString() + ":j" + j2.toString()));
						Resource.ArrayField[i].push(unitAdd); 	// добавляем новый кристал в массив
						fieldParent.addChild(unitAdd);			// добавляем новый кристал на поле (спрайт)
					}
					
				}
				
				/* Анимация перемещения кристалов вниз на пустые места */
				if (arrayCrystal.length < 10) {
					for (var j3:int = 9; j3 >= 0; j3--) {
						/* Анимация перемещения кристалов вниз на пустые места */
						var dMove:DownMove = new DownMove(i, j3, Resource.ArrayField[i][j3]); // (новый индекс строки, кристал)
						Resource.ArrayField[i][j3].IndexI = i;
						Resource.ArrayField[i][j3].IndexJ = j3;
					}
				}
				
				/* ТЕСТ!!! */
				//for (var j4:int = 0; j4 < 10; j4++) {
				//	trace("(ЗАВЕРШЕНИЕ) СТОЛБЕЦ №:" + i.toString() + "  СТРОКА №:" + j4.toString() + " | Индекс(i)=" + Resource.ArrayField[i][j4].IndexI.toString() + "; Индекс(j)=" + Resource.ArrayField[i][j4].IndexJ.toString());
				//}
				
			}
			trace("Механика: Удаление помеченных ячеек");
		}
		
		
		
	}

}