package org.zengrong.robotlegs2.timer.model 
{
/**
 * 定时器Model的接口
 * @author zrong
 */
public interface ITimerModel 
{
	function get minute():int;
	function set minute($value:int):void;
	function get second():int;
	function set second($value:int):void;
	function start():void;
	function stop():void;
}
}