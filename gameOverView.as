package  {
	
	import flash.display.MovieClip;
	
	
	public class gameOverView extends MovieClip {
		
		private var NewHighScore:Number;
		private var UserScore:Number;
		private var TopScore:info;
		
		public function gameOverView() 
		{
			// constructor code
			NewHighScore = 0;
		    UserScore = 0;
			TopScore = new info();
			NewHighScore=TopScore.GetTopScore();
			
		}
		public function setUserScore(NewScore:Number):void
		{
			UserScore = NewScore;
			
			trace(NewHighScore);
			HighScore.text= String(NewHighScore);
			PlayerScore.text = String(UserScore);
			
			if(UserScore >NewHighScore)
			{
				setHighScore(UserScore);
				
			}
			
			
		}
		public function setHighScore(NewScore:Number):void
		{
			NewHighScore=NewScore;
			TopScore.SetHighScore(NewScore);
			HighScore.text = String(NewHighScore);
			
		}
	}
	
}
