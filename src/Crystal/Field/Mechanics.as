package Crystal.Field 
{
	import Crystal.Units.Unit;
	import Crystal.Animation.BackMove;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class Mechanics 
	{
		
		
		
		
		/* Механика: смена позиций и возврат */
		public static function MechanicBackMove(cristal1:Unit, cristal2:Unit, destination:String)
		{
			var bMove:BackMove = new BackMove(cristal1, cristal2, destination);
			//cristal2.x = cristal1.x;
			//cristal2.y = cristal1.y;
			
			trace("Механика: смена позиций и возврат");
		}
		
		
	}

}