package org.zengrong.robotlegs2.timer.cmd 
{

import flash.events.IEventDispatcher;
import org.zengrong.robotlegs2.timer.event.TEvent;
import org.zengrong.robotlegs2.timer.model.ITimerModel;
import robotlegs.bender.bundles.mvcs.Command;
	

/**
 * 主动停止计时
 * @author zrong (http://zengrong.net)
*/
public class TimerStopCmd extends Command 
{
	
	[Inject]
	public var timerModel:ITimerModel;
	
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	
	override public function execute():void
	{
		timerModel.stop();
		eventDispatcher.dispatchEvent(new TEvent(TEvent.CHANGE_STATE, "TimerSetView"));
	}
}
}