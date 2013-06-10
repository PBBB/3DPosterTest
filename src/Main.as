package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends Sprite
	{
		[Embed(source="img/bg.png")]
		private var Imgbg:Class;
		[Embed(source="img/in.png")]
		private var TextIn:Class;
		[Embed(source="img/nw.png")]
		private var TextNW:Class;
		[Embed(source="img/see.png")]
		private var TextSee:Class;
		[Embed(source="img/tw.png")]
		private var TextTW:Class;
		private var bgBMP:Bitmap;
		private var seeBMP:Bitmap;
		private var twBMP:Bitmap;
		private var inBMP:Bitmap;
		private var nwBMP:Bitmap;
		private var seeSprite:Sprite=new Sprite();
		private var twSprite:Sprite=new Sprite();
		private var inSprite:Sprite=new Sprite();
		private var nwSprite:Sprite=new Sprite();
		public function Main()
		{
			super();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			this.addEventListener(Event.ADDED_TO_STAGE, initHD);
		}
		
		protected function initHD(e:Event):void
		{
			stage.addEventListener(MouseEvent.CLICK, clickHd);
			bgBMP=new Imgbg();
			seeBMP=new TextSee();
			seeSprite.addChild(seeBMP);
			seeSprite.x=58;
			seeSprite.y=95;
			twBMP=new TextTW();
			twSprite.addChild(twBMP);
			twSprite.x=65;
			twSprite.y=286;
			inBMP=new TextIn();
			inSprite.addChild(inBMP);
			inSprite.x=58;
			inSprite.y=639;
			nwBMP=new TextNW();
			nwSprite.addChild(nwBMP);
			nwSprite.x=65;
			nwSprite.y=820;
			addChild(bgBMP);
			addChild(seeSprite);
			addChild(twSprite);
			addChild(inSprite);
			addChild(nwSprite);
		}
		
		protected function clickHd(e:MouseEvent):void
		{
			
		}
	}
}