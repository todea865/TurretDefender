package{

    import flash.events.Event;
    import flash.net.*;



	public class info
	{
		
		private var TopScore:Number = 0;
		private var NewScore:SharedObject;
		
		public function info() 
		{
			init();
			// constructor code
		}
		public function init()
        {            
		 NewScore = SharedObject.getLocal("BestScore");
		 NewScore.data.name = "Player";
		 TopScore = NewScore.data.UserScore as int;
		} 
		
		public function GetTopScore():int
        {
			return TopScore;
		}
		
		public function SetHighScore(NewHighScore:Number):void
		{
			
			NewScore.data.name = "Player";
			NewScore.data.UserScore = NewHighScore;
			var stat:String = NewScore.flush();
			
			
		}
	}
}