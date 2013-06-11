package
{
	import com.adobe.nativeExtensions.Gyroscope;
	import com.adobe.nativeExtensions.GyroscopeEvent;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends Sprite
	{
		[Embed(source="img/bg.jpg")]
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
		private var bgSprite:Sprite=new Sprite();
		private var seeSprite:Sprite=new Sprite();
		private var twSprite:Sprite=new Sprite();
		private var inSprite:Sprite=new Sprite();
		private var nwSprite:Sprite=new Sprite();
		private var gyro:Gyroscope;
		public function Main()
		{
			super();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			this.addEventListener(Event.ADDED_TO_STAGE, initHD);
		}
		
		protected function initHD(e:Event):void
		{
			
			bgBMP=new Imgbg();
			bgSprite.addChild(bgBMP);
			
			seeBMP=new TextSee();
			seeSprite.addChild(seeBMP);
			
			twBMP=new TextTW();
			twSprite.addChild(twBMP);
			
			inBMP=new TextIn();
			inSprite.addChild(inBMP);
			
			nwBMP=new TextNW();
			nwSprite.addChild(nwBMP);
			
			resetState();
			
			stage.addEventListener(MouseEvent.CLICK, clickHd);	
		}
		
		protected function clickHd(e:MouseEvent):void
		{
			resetState();
			if(Gyroscope.isSupported){
				if(!gyro){
					gyro=new Gyroscope();
					gyro.setRequestedUpdateInterval(10);
				}
				if(!gyro.hasEventListener(GyroscopeEvent.UPDATE))
				gyro.addEventListener(GyroscopeEvent.UPDATE,onChange);
			}else{
				trace("Gyroscope is not supported.");
			}
		}
		
		protected function onChange(e:GyroscopeEvent):void
		{
			trace("From gyro: " + e.x + " " + e.y + " " + " " + e.z);
			bgSprite.x-=e.y*2;
			bgSprite.y-=e.x*2;
			seeSprite.x+=e.y*2;
			seeSprite.y+=e.x*2;
			inSprite.x+=e.y*2;
			inSprite.y+=e.x*2;
			twSprite.x+=e.y*1;
			twSprite.y+=e.x*1;
			nwSprite.x+=e.y*1;
			nwSprite.y+=e.x*1;
		}
		private function resetState():void{
			bgSprite.x=-180;
			bgSprite.y=-120;
			seeSprite.x=0;
			seeSprite.y=18;
			twSprite.x=65;
			twSprite.y=310;
			inSprite.x=0;
			inSprite.y=524;
			nwSprite.x=65;
			nwSprite.y=808;
			addChild(bgSprite);
			addChild(twSprite);
			addChild(nwSprite);
			addChild(seeSprite);
			addChild(inSprite);
			
		}
	}
}