package org.zengrong.robotlegs2.timer.mediator 
{

import flash.events.MouseEvent;
import org.zengrong.robotlegs2.timer.event.TEvent;
import org.zengrong.robotlegs2.timer.view.AlertView;
import robotlegs.bender.bundles.mvcs.Mediator;

/**
 * AlertView的中介
 * @author zrong (http://zengrong.net)
*/
public class AlertViewMediator extends Mediator 
{
	
	[Inject]
	public var v:AlertView;
	
	public function AlertViewMediator() 
	{
		
	}
	
	override public function initialize():void
	{
		v.dismissBtn.addEventListener(MouseEvent.CLICK, handler_dismiss);
	}
	
	override public function destroy():void
	{
		v.dismissBtn.removeEventListener(MouseEvent.CLICK, handler_dismiss);
		super.destroy();
	}
	
	private function handler_dismiss($evt:MouseEvent):void 
	{
		dispatch(new TEvent(TEvent.CHANGE_STATE, "TimerSetView"));
	}
	
}
}