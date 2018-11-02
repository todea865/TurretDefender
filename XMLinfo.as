package{

    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLLoaderDataFormat;
    import flash.xml.XMLDocument;
    import flash.net.FileReference;



	public class XMLinfo 
	{
		
		private var TopScore:Number = 0;
		private var myXML:XML;
		private var playerListXML:XMLDocument;
        private var loader:URLLoader; 
        private var request:URLRequest;
		private var fr:FileReference = new FileReference();

		
		public function XMLinfo() 
		{
			init();
			// constructor code
		}
		public function init()
        {            
        
          loader = new URLLoader(); 
          request = new URLRequest("Score.xml"); 
          loader.load(request); 
          loader.addEventListener(Event.COMPLETE, onComplete); 
 

		}
		function onComplete(event:Event):void 
        { 
           var loader:URLLoader = event.target as URLLoader; 
            if (loader != null) 
            { 
                myXML = new XML(loader.data); 
				trace (myXML.firstChild.childNodes[1]);

				playerListXML = new XMLDocument();
				playerListXML.ignoreWhite = true;
				playerListXML.parseXML(myXML.toXMLString());
				for each (var player:XML in myXML..player) 
		        {
				  trace (player.PScore);
			      TopScore = player.PScore;
				  trace (TopScore);
		        }
				
            } 
            else 
             { 
             trace("loader is not a URLLoader!"); 
             } 
         }
		public function GetTopScore():int
        {
			return TopScore;
		}
		
		public function SetHighScore(NewHighScore:Number):void
		{
			
			myXML = <Players>
			           <player>
                    <Name>"TTT"</Name>
                    <PScore>NewHighScore.valueOf()</PScore>
					</player>
                    </Players>;
		    fr.save(myXML, "Score.xml");
			
			
			
		}
	}
}