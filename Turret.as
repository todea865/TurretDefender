package  {
	
	import flash.display.MovieClip;
	import flash.display.*;
	import flash.events.*;
	
	public class Turret extends Sprite{
		
		private var speed:Number = 5;
		private var PointX:Number;
		private var PointY:Number;
		
		
		public function Turret() 
		{
			init();
			// constructor code
		}
		private function init():void
		{
			
		   this.addEventListener (Event.ENTER_FRAME,moveGun);
		}
		public function moveGun(event:Event):void
		{
			var myRadians:Number = Math.atan2(PointY- this.y,PointX - this.x );
			var myDegrees:Number = Math.round((myRadians*180/Math.PI));
			this.rotation = myDegrees;
			//

			
		}
		public function updateTurret(NewX,NewY):void
		{
			 PointX = NewX;
		     PointY = NewY;
		}
		public function Shoot(newX:Number,newY:Number):void
		{
			
			
		}
	}
	
}
