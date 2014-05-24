package Crystal.Field 
{
	import Crystal.Units.Unit;
	import Crystal.Animation.BackMove;
	import Crystal.Animation.ExchangeMove;
	import Crystal.Resource;
	
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
			
			
			if (CheckRow(crystal1.IndexJ) == true || CheckColumn(crystal1.IndexI) == true) {
				/* 1-й кристал собран в группу
				 * Выполняем обработку 2-го кристала */
				CheckRow(crystal2.IndexJ); 
				CheckColumn(crystal2.IndexI);
				/* Анимация */
				eMove = new ExchangeMove(crystal1, crystal2, destination);
			
				/* Производим удаление кристалов */
				Remove();
				
			}else {
				/* 1-й кристал НЕ собран в группу
				 * Выполняем проверку 2-го кристала */
				if (CheckRow(crystal2.IndexJ) == true || CheckColumn(crystal2.IndexI) == true) {
					/* 2-й кристал собран в группу */
					
					/* Анимация */
					eMove = new ExchangeMove(crystal1, crystal2, destination);
					/* Производим удаление кристалов */
					Remove();
					
				} else {
					/* Оба кристала не вошли в группу */
					ExchangeCrystals(crystal2, crystal1); // обратный обмен кристалов местами
					bMove = new BackMove(crystal1, crystal2, destination);
				}
			}
			
			trace("Механика: Пользователь сделал ход");
		}
		
		/* Обмен в массиве выбранных пользователем кристалов местами */
		public static function ExchangeCrystals(crystal1:Unit, crystal2:Unit)
		{
			var crystal:Unit = new Unit();
			crystal = crystal1;
			crystal1 = crystal2;
			crystal2 = crystal;
			
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
		
		/* Удаление на поле всех отмеченных ячеек */
		public static function Remove()
		{
			// i - столбец; j - строка
			for (var i:int = 0; i < 10; i++) {
				for (var j:int = 0; j < 10; j++) {
					if (Resource.ArrayField[i][j].Remove == true) Resource.ArrayField[i][j].visible = false;
				}
			}
			trace("Механика: Удаление помеченных ячеек");
		}
		
	}

}