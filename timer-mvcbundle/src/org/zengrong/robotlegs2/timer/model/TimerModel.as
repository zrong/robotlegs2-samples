package org.zengrong.robotlegs2.timer.model 
{
import flash.events.IEventDispatcher;
import flash.events.TimerEvent;
import flash.utils.Timer;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.framework.api.ILogger;
/**
 * 实现定时器Model
 * @author zrong (http://zengrong.net)
*/
public class TimerModel implements ITimerModel 
{
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	
	[Inject]
	public var logger:ILogger;
	
	public function TimerModel() 
	{
		init();
	}
	
	private var _internalTimer:Timer;
	
	private var _minute:int;
	
	public function get minute():int 
	{
		return _minute;
	}
	
	public function set minute(value:int):void 
	{
		_minute = value;
	}
	
	private var _second:int;
	
	public function get second():int 
	{
		return _second;
	}
	
	public function set second($value:int):void 
	{
		_second = $value;
	}
	
	public function get running():Boolean
	{
		return _internalTimer;
	}
	
	private function init():void
	{
		_internalTimer = new Timer(1000);
		_internalTimer.addEventListener(TimerEvent.TIMER, handler_timer);
	}
	
	public function start():void
	{
		if(_internalTimer.running) return;
		_internalTimer.start();
		logger.debug("InternalTimer start");
	}
	
	public function stop():void
	{
		_internalTimer.reset();
	}
	
	private function updateTimer():void
	{
		if(second > 0)
		{
			second --;
		}
		else if(minute > 0)
		{
			minute --;
			second = 59;
		}
	}
	
	private function handler_timer($evt:TimerEvent):void 
	{
		updateTimer();
		if(minute == 0 && second == 0)
		{
			eventDispatcher.dispatchEvent(new TimerEvent(TimerEvent.TIMER_COMPLETE));
			stop();
			return;
		}
		eventDispatcher.dispatchEvent($evt);
		logger.debug(_internalTimer.currentCount);
	}
}
}