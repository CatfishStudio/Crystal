package Crystal.Text 
{
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Label extends TextField
	{
		
		public function Label(x:int, y:int, w:int, h:int, font:String, size:int, color:int, text:String) 
		{
			this.x = x;	this.y = y; 			// положение
			this.width = w;	this.height = h; 	// размер
			this.defaultTextFormat = new TextFormat(font, size, color); // формат
			this.htmlText = text; 				// текст
			this.selectable = false; 			// запрет выделения текста
			
		}
		
	}

}