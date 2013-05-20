package org.zengrong.robotlegs2.timer.mediator 
{

import flash.events.MouseEvent;
import flash.events.TimerEvent;
import org.zengrong.robotlegs2.timer.event.TEvent;
import org.zengrong.robotlegs2.timer.model.ITimerModel;
import org.zengrong.robotlegs2.timer.view.AlertView;
import org.zengrong.robotlegs2.timer.view.TimerActionView;
import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.localEventMap.api.IEventMap;
import robotlegs.bender.framework.api.ILogger;
/**
 * TimerActionView的Mediator
 * @author zrong (http://zengrong.net)
*/
public class TimerActionMediator extends Mediator 
{
	[Inject]
	public var logger:ILogger;
	
	[Inject]
	public var v:TimerActionView;
	
	[Inject]
	public var timerModel:ITimerModel;
	
	public function TimerActionMediator() 
	{
	}
	
	override public function initialize():void
	{
		super.initialize();
		logger.info(v.toString());
		this.addContextListener(TimerEvent.TIMER, handler_timerUpdate);
		this.addContextListener(TimerEvent.TIMER_COMPLETE, handler_timerComp);
		v.cancelBtn.addEventListener(MouseEvent.CLICK, handler_cancel);
		
		updateTimer();
	}
	
	override public function destroy():void
	{
		this.removeContextListener(TimerEvent.TIMER, handler_timerUpdate);
		v.cancelBtn.removeEventListener(MouseEvent.CLICK, handler_cancel);
		super.destroy();
	}
	
	private function updateTimer():void
	{
		v.updateTimer(timerModel.minute, timerModel.second);
	}
	
	private function handler_timerUpdate($evt:TimerEvent):void 
	{
		updateTimer();
	}
	
	private function handler_timerComp($evt:TimerEvent):void 
	{
		v.updateTimer(0, 0);
		dispatch(new TEvent(TEvent.CHANGE_STATE, AlertView));
	}
	
	private function handler_cancel($evt:MouseEvent):void 
	{
		dispatch(new TEvent(TEvent.TIMER_STOP));
	}
}
}