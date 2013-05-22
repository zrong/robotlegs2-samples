package  
{
import com.bit101.components.Component;
import com.bit101.components.Style;
import flash.display.*;
import flash.events.IEventDispatcher;
import org.zengrong.robotlegs2.AppConfig;
import org.zengrong.robotlegs2.timer.event.TEvent;
import org.zengrong.robotlegs2.timer.view.TimerSetView;
import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.LogLevel;
import robotlegs.bender.framework.impl.Context;

/**
 * 主文件
 * @author zrong
 */
[SWF(width=200,height=300)]
public class Robotlegs2TimerExample extends Sprite
{
	public function Robotlegs2TimerExample() 
	{
		Style.embedFonts = true;
		Style.fontSize = 8;
		Component.initStage(this.stage);
		init();
	}
	
	private var _context:IContext;
	
	private function init():void
	{
		_context = new Context()
		.install(MVCSBundle)
		.configure(AppConfig)
		.configure(new ContextView(this));
		
		_context.logLevel = LogLevel.DEBUG;
		trace("init done");
		
		//这里通过内置的事件框架来实现View的启动
		(_context.injector.getInstance(IEventDispatcher) as IEventDispatcher).dispatchEvent(new TEvent(TEvent.CHANGE_STATE, TimerSetView));
	}
}
}