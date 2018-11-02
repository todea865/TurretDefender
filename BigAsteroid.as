package  {
	
	import flash.display.MovieClip;
	
	
	public class BigAsteroid extends Asteroid{
		
		private var MaxHitPoints:Number;
		private var HitPoints:Number;
		
		public function BigAsteroid() 
		{
			init();// constructor code
			
			//Set up hit points
			MaxHitPoints = 10;
			HitPoints = MaxHitPoints;
		}
		public function subtractHitPoints(subtractHit:Number):void
		{
			
			HitPoints -= subtractHit;
			
			if(HitPoints <= 1)
			{
				resetAsteroid();
				HitPoints = MaxHitPoints;
			}
		}
		
	}
	
}
