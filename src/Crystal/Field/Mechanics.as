package Crystal.Field 
{
	import Crystal.Units.Unit;
	
	/**
	 * Catfish Studio
	 * @author Somov Evgeniy
	 */
	
	public class Mechanics 
	{
				
		/* Механика: смена позиций и возврат */
		public static function BackMove(cristal1:Unit, cristal2:Unit)
		{
			//cristal2.x = cristal1.x;
			//cristal2.y = cristal1.y;
			cristal2.y -= 10;
			
			trace("Механика: смена позиций и возврат");
		}
		
		
	}

}