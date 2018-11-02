//Tom O'Dea
//Lab 7
//AG_101
//4/6/10

package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.media.Sound;

	public class Bullet extends Sprite
	{
		private var myFireSound:Sound; //added for hitting star sound		
		private var bulletMoving:Boolean = false;		
		private var deltaX, deltaY, myBulletRotation:Number = 0;

		public function Bullet ()
		{
			//trace("inside Bullet constructor");
			init();			
	    }// end constructor Bullet
		
		public function init():void
		{			
			//myFireSound= new gunshot();	
			// set start position below stage
			this.x = -80;
			this.y = 900;  //increased depth to prevent collisions when hidden
	
			 this.addEventListener (Event.ENTER_FRAME, moveBullet);
		}//end init
		
		//get the gun x,y and assign to bullet start x,y
		//also pass along the dx and dy of the bullet travel
		public function startBullet(x,y, dx, dy, rotationBullet:Number):void 
		{
			//trace("inside startBullet");			
			if( bulletMoving == false) //if no bullet in moving
			{
				//trace("inside if inside startBullet");		
				
				this.x = x; //location of bullet
				this.y = y;			   
				deltaX = dx; //assign to variable above
				deltaY = dy;
				myBulletRotation = rotationBullet;
				this.rotation = myBulletRotation;  //actually can use here
			   bulletMoving = true;			  
			}
		}// end startBullet

		public function moveBullet (event:Event):void
		{
			//trace("inside  moveBullet ");
			if( bulletMoving == true)
			{
					// move bullet
					this.y += deltaY;
					this.x += deltaX;
		
					// bullet past  screen
					if (this.y < -10 || this.y > 1000 || this.x < -10 || this.x > 550)
					{						
						this.x = -80;
						this.y = 900;
						bulletMoving = false; //stop moving bullet
					} //end inner if	
			} //end outer if
		}//end  moveBullet
		
		public function resetBullet():Boolean //if bullet hit reset bullet to bottom and stop moving
		{
						this.x = -80;
						this.y = 900;
						bulletMoving = false; //stop moving bullet		
						return  bulletMoving;
		}//end resetBullet 

	}//end class Bullet
}//end package