package org.zengrong.robotlegs2.timer.event 
{
import flash.events.Event;
	
/**
 * 项目使用的事件类
 * @author zrong
 */
public class TEvent extends Event 
{
	public static const TIMER_START:String = "timerStart";
	public static const TIMER_STOP:String = "timerStop";
	public static const ALERT_DISMISS:String = "alertDismiss";
	public static const CHANGE_STATE:String = "changeState";
	
	public function TEvent(type:String, $info:Object=null, bubbles:Boolean=false, cancelable:Boolean=false) 
	{ 
		super(type, bubbles, cancelable);
		info = $info;
	} 
	
	public var info:Object;
	
	public override function clone():Event 
	{ 
		return new TEvent(type, bubbles, cancelable);
	} 
	
	public override function toString():String 
	{ 
		return formatToString("TEvent", "type", "bubbles", "cancelable", "eventPhase"); 
	}
}
}