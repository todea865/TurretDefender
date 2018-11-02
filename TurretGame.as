package  {
	
	//just added common imports
	import flash.ui.*;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.*;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;  //added for timer, of course!
	import flash.media.Sound;
	
	
	
	public class TurretGame extends MovieClip {
		
		
			
		private var bulletArray:Array;  //need more bullets
		private var numBullets:Number = 10;
		private var BulletLimit:Number = numBullets;
		private var bulletSpeed:Number = 23;  // cannon can move at 5 so making these a little faster
		private var shotxspeed:Number = 0; //calculated value of delta x based on angle of cannon
 		private var shotyspeed:Number = 0;  ////calculated value of delta y based on angle of cannon
		private var whichBullet:Number = 0;  //keeps count of which bullet to fire
		private var canFire:Boolean = true; //must press space bar for each bullet.
		private var newMetior:metior;
		private var MainCannonShot:SuperAttack;
		
		private var asteroidArray:Array;
		private var numAsteroids:Number = 5;
		private var whichAsteroid:Number = 0;
		
		// create a Timer to call a function every few seconds
		private var myTimer:Timer;
		  //keeps count of which asteroid to start
		
		private var Score:Number;
		private var Shield:Number;
		
		private var gameover:Boolean;
		
		
		public function TurretGame() 
		{
			Score = 0;
			Shield = 10;
			gameover = false;
			bulletArray = new Array();
			canFire = true;
		    //add bullets
			for (var y:uint = 0; y < numBullets; y++)
			{
				//trace("inside for loop");
				var newBullet = new Bullet();
				addChild (newBullet);
				bulletArray.push (newBullet);
			}// end for
			
			asteroidArray = new Array();
			
			//add asteroids
			for (var i:uint = 0; i < numAsteroids; i++)
			{
				var newAsteroid = new Asteroid();	
				addChild (newAsteroid);
				asteroidArray.push (newAsteroid);
			}// end for
			//Add Big Asteroid
			
			newMetior = new metior();
			addChild (newMetior);
			asteroidArray.push (newMetior);
			
			removeChild(ScoreBoard);
			addChild(ScoreBoard);
			
			
			myTimer = new Timer(6000);
			myTimer.addEventListener(TimerEvent.TIMER, timerFunction);
			myTimer.start();
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			this.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			this.addEventListener(MouseEvent.CLICK, onMousePress);
            this.addEventListener(MouseEvent.MOUSE_UP, onMyMouseUp);
			//this.addEventListener(TouchEvent.TOUCH_BEGIN, onMyTouch);
//			this.addEventListener(TouchEvent.TOUCH_END, onMyTouchEnd);
			
			// constructor code
		}
		// function adds a dot to the screen
		public function timerFunction(event:TimerEvent) :void
		{
			//trace("inside timerFunction");
			//trace("whichAsteroid = " + whichAsteroid);
			asteroidArray[ whichAsteroid ].startAsteroid();
			whichAsteroid++;
			
			if( whichAsteroid >= (asteroidArray.length))
			{
				whichAsteroid = 0;
			}		
			ScoreBoard.StatisBox.text = String("Begin");
			
			removeChild(ScoreBoard);
			addChild(ScoreBoard);
			
		}
		public function onEnterFrame(event:Event):void	
		{
			GameTurret.updateTurret(mouseX,mouseY);
			
			ScoreBoard.score.text = String(Score);
			ScoreBoard.shield.text = String(Shield+"/10");
			
			
			for(var bulletCellNum:int=bulletArray.length-1;bulletCellNum>=0;bulletCellNum--)
			{				
					
				for (var asteroidCellNum:int=asteroidArray.length-1; asteroidCellNum>=0; asteroidCellNum--)
				{
						if( bulletArray[ bulletCellNum].hitTestObject(asteroidArray[ asteroidCellNum ] ))
						{
							//gamescore ++;
							//dissplay.text = String(gamescore);
							//trace("inside if( myBullet.hitTestObject");
							//myHitSound.play(0,1);
							
							if(asteroidArray[ asteroidCellNum ] == BigAsteroid)
							{
								asteroidArray[ asteroidCellNum ].subtractHitPoints(1);
								
							}
							else
							{
							    asteroidArray[ asteroidCellNum ].resetAsteroid(); //send asteroid to top and start again
							
							   
							} 
							bulletArray[ bulletCellNum].resetBullet(); //send bullet to bottom and stop moving
							 Score += 10;   
						}//end if
				}//end inner asteroid
			}//end outer for			
			
			//ControleAsteroid screen moement
			for (var asteroidNum:int=asteroidArray.length-1; asteroidNum>=0; asteroidNum--)
				{
			         if( asteroidArray[ asteroidNum].y > 610)
						{
							
							asteroidArray[ asteroidNum ].resetAsteroid();
							Shield -=1;
						
						}
						if(asteroidArray[ asteroidNum].x > 440 || asteroidArray[ asteroidNum].x < -10)
						{
							asteroidArray[ asteroidNum].ChangeXVelocity();
							
						}
				}
				if(Shield <=0)
				{
					gameover = true;
				}
				
				
		}
		//public function onMyTouch(event:TouchEvent):void
//		{
//             FireTurret(event.target.x ,event.target.y);
//		}
		public function onMousePress(event:MouseEvent):void
		{
			
			 FireTurret(mouseX,mouseY);
			
		}
		public function onMyMouseUp(event:MouseEvent):void
		{
			trace("inside mouseup");
			
			canFire = true;
		}//end onMyMouseUp
		
		//public function onMyTouchEnd(event:TouchEvent):void
//		{
//			trace("inside mouseup");
//			canFire = true;
//		}//end TouchEnd
		public function getScore():int
		{
			return Score;
		}
		function radiansToDegrees(radians:Number):Number{
            
            return radians * 180 / Math.PI;
        }
		public function isGameOver():Boolean
		{
			return gameover;
			
		}
		public function GAMEOVER():void
		{
			for (var y:uint = 0; y < numBullets-1; y++)
			{
				
				removeChild (bulletArray[y]);
	
			}// end for
			
			
			for (var i:uint = 0; i < numAsteroids-1; i++)
			{
				
				
				asteroidArray[i].endgame1();
				
			}// end for
			
			stage.removeEventListener( Event.ENTER_FRAME,onEnterFrame);
			stage.removeEventListener( Event.REMOVED_FROM_STAGE,GAMEOVER);
			stage.removeEventListener(MouseEvent.CLICK, onMousePress);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMyMouseUp);
			
		}
		public function FireTurret(NewX:Number, NewY:Number):void
		{
			trace("inside onMousePress");

			var tempDeltaY:Number = GameTurret.y - NewY;
			var tempDeltaX:Number = GameTurret.x - NewX;
			var tempDistance:Number = Math.sqrt(tempDeltaX*tempDeltaX + tempDeltaY*tempDeltaY);				
			//trace("tempDistance = " + tempDistance);
			
			//			sine of an angle = o/h;			
			var tempSin:Number = (GameTurret.y - NewY)/ tempDistance;
			//trace(" tempSin = " + tempSin);
			shotyspeed= bulletSpeed * tempSin;
			//Flash coor reversed
			shotyspeed = shotyspeed * -1;
			//trace("shotyspeed = " + shotyspeed );
			
			//			cosine of an angle =  a/h;
			var tempCos:Number =  (NewX- GameTurret.x)/ tempDistance;
			//trace(" tempCos = " + tempCos);	
			shotxspeed= bulletSpeed * tempCos;
			//trace("shotxspeed = " + shotxspeed );
			
			var myRadians:Number = Math.atan2(NewY- GameTurret.y, NewX- GameTurret.x);
			var bulletRotation:Number = Math.round((myRadians*180/Math.PI));			

			//myBullet.startBullet ( myCannon.x, myCannon.y, shotxspeed, shotyspeed, bulletRotation);
			
				if(canFire == true && BulletLimit > 0)
				{
					//BulletLimit--;
					trace("inside onMousePress");
						bulletArray[ whichBullet ].startBullet( GameTurret.x, GameTurret.y, shotxspeed, shotyspeed, bulletRotation);
						trace(whichBullet);
						//myFireSound.play(0,1);
						whichBullet++;
						if( whichBullet >= (bulletArray.length - 1))
						{
							whichBullet = 0;
						}	//end inner if
						
						canFire = false;
				}//end outer if
			
			
		}
		public function getBulletLimit():Number
		{
			return BulletLimit;
		}
	}
	
}
