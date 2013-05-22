package org.zengrong.robotlegs2.timer.cmd 
{
import flash.display.DisplayObject;
import org.zengrong.robotlegs2.timer.event.TEvent;
import org.zengrong.robotlegs2.timer.model.ViewModel;
import org.zengrong.robotlegs2.timer.view.ITimerView;
import org.zengrong.robotlegs2.timer.view.TimerSetView;
import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.viewManager.api.IViewHandler;
import robotlegs.bender.framework.api.ILogger;
/**
 * 负责切换界面状态
 * @author zrong (http://zengrong.net)
*/
public class ChangeStateCmd extends Command 
{
	[Inject]
	public var evt:TEvent;
	
	[Inject]
	public var logger:ILogger;
	
	[Inject]
	public var contextView:ContextView;
	
	[Inject]
	public var viewModel:ViewModel;
	
	override public function execute():void
	{
		logger.debug(evt.info);
		logger.debug(contextView.view.numChildren);
		if(contextView.view.numChildren > 0)
		{
			var __currentView:ITimerView = contextView.view.getChildAt(0) as ITimerView;
			if(__currentView)
			{
				contextView.view.removeChild(__currentView as DisplayObject);
			}
		}
		var __newView:DisplayObject = viewModel.getView(evt.info) as DisplayObject;
		center(__newView);
		contextView.view.addChild(__newView);
		logger.debug("get view:{0}", [__newView]);
	}
	
	private function center($view:DisplayObject):void
	{
		$view.x = (contextView.view.stage.stageWidth - $view.width) / 2;
		$view.y = (contextView.view.stage.stageHeight - $view.height) / 2;
	}
}
}