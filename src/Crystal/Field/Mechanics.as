package Crystal.Field 
{
	import Crystal.Units.Unit;
	import Crystal.Animation.BackMove;
	import Crystal.Resource;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class Mechanics 
	{
		
		
		
		
		/* Механика: Пользователь сделал ход */
		public static function ActionMove(cristal1:Unit, cristal2:Unit, destination:String)
		{
			
			if (CheckRow(cristal1.IndexJ) == true || CheckColumn(cristal1.IndexI) == true) {
				/* 1-й кристал собран в группу
				 * Выполняем обработку 2-го кристала */
				CheckRow(cristal2.IndexJ); 
				CheckColumn(cristal2.IndexI);
			}else {
				/* 1-й кристал НЕ собран в группу
				 * Выполняем проверку 2-го кристала */
				if (CheckRow(cristal2.IndexJ) == true || CheckColumn(cristal2.IndexI) == true) {
					/* 2-й кристал собран в группу */
				} else {
					/* Оба кристала не вошли в группу */
					var bMove:BackMove = new BackMove(cristal1, cristal2, destination);
				}
			}
			
			
			//CheckMove(cristal1);
			trace("Механика: смена позиций и возврат");
		}
		
		/* Механика: Проверка строки */
		public static function CheckRow(row:int):Boolean
		{
			
			
			return false;
		}
		
		/* Механика: Проверка строки */
		public static function CheckColumn(column:int):Boolean
		{
			
			
			return false;
		}
	}

}