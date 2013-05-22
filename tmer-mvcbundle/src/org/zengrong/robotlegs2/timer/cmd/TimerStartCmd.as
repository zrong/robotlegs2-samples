package org.zengrong.robotlegs2.timer.cmd 
{
import org.zengrong.robotlegs2.timer.event.TEvent;
import org.zengrong.robotlegs2.timer.model.ITimerModel;
import robotlegs.bender.bundles.mvcs.Command;

/**
 * 处理计时器开始时候的动作
 * @author zrong (http://zengrong.net)
*/
public class TimerStartCmd extends Command 
{
	[Inject]
	public var timerModel:ITimerModel;
	
	[Inject]
	public var evt:TEvent;
	
	override public function execute():void
	{
		timerModel.minute = evt.info.minute;
		timerModel.second = evt.info.second;
		timerModel.start();
	}
	
}
}