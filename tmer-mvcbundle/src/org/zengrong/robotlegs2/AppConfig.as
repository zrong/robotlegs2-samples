package org.zengrong.robotlegs2 
{

import org.swiftsuspenders.Injector;
import org.zengrong.robotlegs2.timer.cmd.ChangeStateCmd;
import org.zengrong.robotlegs2.timer.cmd.TimerStartCmd;
import org.zengrong.robotlegs2.timer.cmd.TimerStopCmd;
import org.zengrong.robotlegs2.timer.event.TEvent;
import org.zengrong.robotlegs2.timer.mediator.AlertViewMediator;
import org.zengrong.robotlegs2.timer.mediator.TimerActionMediator;
import org.zengrong.robotlegs2.timer.mediator.TimerSetMediator;
import org.zengrong.robotlegs2.timer.model.ITimerModel;
import org.zengrong.robotlegs2.timer.model.TimerModel;
import org.zengrong.robotlegs2.timer.model.ViewModel;
import org.zengrong.robotlegs2.timer.view.AlertView;
import org.zengrong.robotlegs2.timer.view.TimerActionView;
import org.zengrong.robotlegs2.timer.view.TimerSetView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.ILogger;

/**
 * 程序的主Config
 * @author zrong (http://zengrong.net)
*/
public class AppConfig implements IConfig 
{
	[Inject]
	public var injector:Injector;
	
	[Inject]
	public var mediatorMap:IMediatorMap;
	
	[Inject]
	public var commandMap:IEventCommandMap;
	
	[Inject]
	public var logger:ILogger;
	
	public function AppConfig() 
	{
		
	}
	
	public function configure():void
	{
		models();
		mediators();
		commands();
		logger.info("logger in AppConfig");
	}
	
	private function models():void
	{
		injector.map(ITimerModel).toSingleton(TimerModel);
		injector.map(ViewModel).asSingleton();
	}
	
	private function mediators():void
	{
		mediatorMap.map(TimerSetView).toMediator(TimerSetMediator);
		mediatorMap.map(TimerActionView).toMediator(TimerActionMediator);
		mediatorMap.map(AlertView).toMediator(AlertViewMediator);
	}
	
	private function commands():void
	{
		commandMap.map(TEvent.TIMER_START, TEvent).toCommand(TimerStartCmd);
		commandMap.map(TEvent.TIMER_STOP, TEvent).toCommand(TimerStopCmd);
		commandMap.map(TEvent.CHANGE_STATE, TEvent).toCommand(ChangeStateCmd);
	}
}
}