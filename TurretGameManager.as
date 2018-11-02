package  {
	
	//just added common imports
	import flash.ui.*;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.*;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;  //added for timer, of course!
	import flash.events.TouchEvent;
	import flash.media.Sound;
	
	
	public class TurretGameManager extends MovieClip
	{
		//Add screens
		private var Mainmenu:MainScreen;
		private var NewTurretGame:TurretGame;
		private var GameOverMenu:gameOverView;
		private var InstructionsManual:Instructions_Screen;

		public function TurretGameManager() 
		{
			init();// constructor code
		}
		public function init():void
		{
			//Add menu
			 Mainmenu = new MainScreen();
			 Mainmenu.x = 0;
			 Mainmenu.y = 0; 
			//Add New Game over screen
			 GameOverMenu= new gameOverView();
			 addChild(Mainmenu);
			 
			 
			 //Add  events and touch mode
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			stage.addEventListener(TouchEvent.TOUCH_BEGIN,  onMenuTouch);
			stage.addEventListener(MouseEvent.CLICK, onMenuPress);
			this.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			 
			 
		}
		public function  startGameClick(event:MouseEvent):void
		{
			    //Start main game
				NewTurretGame = new TurretGame();
				NewTurretGame.x = 0;
			    NewTurretGame.y = 0;
			    addChild(NewTurretGame);
				removeChild(InstructionsManual);
			    InstructionsManual.StartGame.removeEventListener(MouseEvent.CLICK,  startGameClick);
			    InstructionsManual.StartGame.removeEventListener(TouchEvent.TOUCH_BEGIN,startGameTouch);
			    stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			
		}
		public function  startGameTouch(event:TouchEvent):void
		{

				NewTurretGame = new TurretGame();
				NewTurretGame.x = 0;
			    NewTurretGame.y = 0;
			    addChild(NewTurretGame);
				removeChild(InstructionsManual);
			    InstructionsManual.StartGame.removeEventListener(MouseEvent.CLICK,  startGameClick);
			    InstructionsManual.StartGame.removeEventListener(TouchEvent.TOUCH_BEGIN, startGameTouch);
			    stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			
		}
		public function onMenuPress(event:MouseEvent):void
		{
			if( event.target== Mainmenu.InstructionsPage)
			{
				
				InstructionsManual = new Instructions_Screen();
				InstructionsManual.x = 0;
			    InstructionsManual.y = 0;
			    addChild(InstructionsManual);
				removeChild(Mainmenu); 
				stage.removeEventListener(MouseEvent.CLICK, onMenuPress);
				stage.removeEventListener(TouchEvent.TOUCH_BEGIN,onMenuTouch);
			    InstructionsManual.StartGame.addEventListener(MouseEvent.CLICK, startGameClick);
				InstructionsManual.StartGame.addEventListener(TouchEvent.TOUCH_BEGIN, startGameTouch);
			}
			if( event.target == Mainmenu.StartGame)
			{
				NewTurretGame = new TurretGame();
				NewTurretGame.x = 0;
			    NewTurretGame.y = 0;
				removeChild(Mainmenu);
			    addChild(NewTurretGame);
			    stage.removeEventListener(MouseEvent.CLICK, onMenuPress); 
				
			    stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);


			}
			if( event.target== GameOverMenu.playAgain)
			{
				NewTurretGame = new TurretGame();
				NewTurretGame.x = 0;
			    NewTurretGame.y = 0;
			    addChild(NewTurretGame);
				removeChild(GameOverMenu);
				stage.removeEventListener(MouseEvent.CLICK, onMenuPress); 
				stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);

			}
			
		}
		public function onMenuTouch(event:TouchEvent):void
		{
			if( event.target== Mainmenu.InstructionsPage)
			{
				
				InstructionsManual = new Instructions_Screen();
				InstructionsManual.x = 0;
			    InstructionsManual.y = 0;
			    addChild(InstructionsManual);
				removeChild(Mainmenu); 
				stage.removeEventListener(MouseEvent.CLICK, onMenuPress);
				stage.removeEventListener(TouchEvent.TOUCH_BEGIN,onMenuTouch);
			    InstructionsManual.StartGame.addEventListener(MouseEvent.CLICK, startGameClick);
				InstructionsManual.StartGame.addEventListener(TouchEvent.TOUCH_BEGIN, startGameTouch);
			}
			if( event.target == Mainmenu.StartGame)
			{
				
				NewTurretGame = new TurretGame();
				NewTurretGame.x = 0;
			    NewTurretGame.y = 0;
				NewTurretGame.
				removeChild(Mainmenu);
			    addChild(NewTurretGame);
			    stage.removeEventListener(MouseEvent.CLICK, onMenuPress); 
				
			    stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);


			}
			if( event.target== GameOverMenu.playAgain)
			{
				NewTurretGame = new TurretGame();
				NewTurretGame.x = 0;
			    NewTurretGame.y = 0;
			    addChild(NewTurretGame);
				removeChild(GameOverMenu);
				stage.removeEventListener(MouseEvent.CLICK, onMenuPress); 
				stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);

			}
			
		}
		public function onEnterFrame(event:Event):void
		{
			
			if(NewTurretGame.isGameOver())
			{
				NewTurretGame.GAMEOVER();
				NewTurretGame.visible = false;
			  
			    GameOverMenu.x = 0;
			    GameOverMenu.y = 0;
				GameOverMenu.setUserScore(NewTurretGame.getScore());
			    addChild(GameOverMenu);
			    stage.addEventListener(MouseEvent.CLICK, onMenuPress);
			    stage.removeEventListener(Event.ENTER_FRAME,onEnterFrame) ;
			
			}
			
			
		}
		

	}
	
}
