package org.zengrong.robotlegs2.timer.mediator 
{

import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.events.MouseEvent;
import org.zengrong.robotlegs2.timer.event.TEvent;
import org.zengrong.robotlegs2.timer.view.AlertView;
import org.zengrong.robotlegs2.timer.view.TimerActionView;
import org.zengrong.robotlegs2.timer.view.TimerSetView;
import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.api.ILogger;
/**
 * TimerSetView的Mediator
 * @author zrong (http://zengrong.net)
*/
public class TimerSetMediator extends Mediator 
{
	[Inject]
	public var logger:ILogger;
	
	[Inject]
	public var v:TimerSetView;
	
	public function TimerSetMediator() 
	{
	}
	
	override public function initialize():void
	{
		super.initialize();
		logger.info("initialize");
		v.startBtn.addEventListener(MouseEvent.CLICK, handler_start);
	}
	
	override public function destroy():void
	{
		v.startBtn.removeEventListener(MouseEvent.CLICK, handler_start);
		super.destroy();
		logger.info("destory");
	}
	
	private function handler_start(e:Event):void 
	{
		logger.debug("click");
		eventDispatcher.dispatchEvent(new TEvent(TEvent.TIMER_START, {minute:v.minute, second:v.second}));
		eventDispatcher.dispatchEvent(new TEvent(TEvent.CHANGE_STATE, TimerActionView));
	}
}
}