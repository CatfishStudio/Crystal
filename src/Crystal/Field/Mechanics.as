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
			var bMove:BackMove = new BackMove(cristal1, cristal2, destination);
			//CheckMove(cristal1);
			trace("Механика: смена позиций и возврат");
		}
		
		/* Механика: Проверка результата совершенного хода пользователем */
		public static function CheckMove(crystal:Unit):Boolean
		{
			var index:int = crystal.Index;
			
			
			return true;
		}
	}

}