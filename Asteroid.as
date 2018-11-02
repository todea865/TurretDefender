//Tom O'Dea
//Lab 7
//AG_101
//4/6/10

package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent 
	
	public class Asteroid extends Sprite
	{
		//trace("inside Asteroid");
		private var vx:Number; //added here as this is not a dynamic class
		private var vy:Number = -400; //to start put above stage
		private var canStartAsteroid = true;
	    private var speed1:Number = 3; 
		private var speed2:Number = 6; 
		private var verticleSpeed:Number = Math.random()*16 -8; 
		private var turningSpeed:Number = Math.random()*2 -1; 
		
		public function Asteroid() //constructor; same name as class and no return
		{
			//trace("inside Asteroid constructor");
			init();
		}
		
		private function init():void
		{		
				//trace("inside init");
				this.y += vy;  //out of view to start
				this.x += vx; 	
				this.addEventListener(Event.ENTER_FRAME, onEnterFrame);			
		}//end init
		
		public function startAsteroid():void 
		{
			//trace("inside startAsteroid");
			if(canStartAsteroid == true)
			{	
				//trace("inside (canStartAsteroid == true");
				//each movie clip object is responsible for its own code and data
				//note the word "this" is refering to a property of the individual movie clip we are inside of...
				this.x =   Math.random() * 430; 
				this.y = Math.random() * -100 - 100;  //notice placing above the stage
				vy = Math.random() * speed1  + speed2; //only setting vertical velocity, played to look good...
				vx = verticleSpeed;
				canStartAsteroid = false;
			}//end if			
			
		}//end startAsteroid
		
		private function onEnterFrame(myEvent:Event):void
		{
			//trace("inside onEnterFrame inside Asteroid"); //working	
			if(canStartAsteroid == false)
			{
				this.y += vy;  //location of display
				this.x += vx;
			}
			
			if(this.y - 50 > 800)  //if went below stage set to top again
			{
					this.y = Math.random() * -400 - 100;
					this.x =   Math.random() * 460 ;
					
					vy = Math.random() * speed1 +speed2;
					verticleSpeed = Math.random()*10 -5; 
					canStartAsteroid = true;
			}	
			
			this.rotation  += turningSpeed;
			
		} //end onEnterFrame	
		public function ChangeXVelocity():void
		{
			vx = -vx ;
		}
		public function resetAsteroid():void //if hit move to top of screen again
		{
			speed1 += .001;
			speed2 += .001;
			this.y = Math.random() * -100 - 100;
			this.x =   Math.random() * 430;
			
			vy = Math.random() * speed1 + speed2; 
			verticleSpeed = Math.random()*10 -5; 
		}//end resetAsteroid
		public function endgame1():void
		{
			this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);			
			speed1 = 1;
			speed2 = 4;
			this.y = -1111;
			this.x = 1111;
			vy = 0;
		}
		public function SetSpeeds(NewFirstSpeed:Number,NewSecondSpeed:Number,NewTurningSpeed:Number,NewHorizontelSpeed:Number ):void
		{
			speed1 = NewFirstSpeed;
		    speed2 = NewSecondSpeed;
			turningSpeed = NewTurningSpeed;
			verticleSpeed =NewHorizontelSpeed;
		}   
			
		
	}// end class Asteroid
}// end package