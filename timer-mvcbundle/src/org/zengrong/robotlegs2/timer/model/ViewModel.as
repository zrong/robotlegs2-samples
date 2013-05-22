package org.zengrong.robotlegs2.timer.model 
{
import flash.utils.Dictionary;
import flash.utils.getDefinitionByName;
import org.zengrong.robotlegs2.timer.view.ITimerView;
import robotlegs.bender.extensions.viewManager.api.IViewHandler;
/**
 * 保存所有的View
 * @author zrong
 */
public class ViewModel 
{
	
	public function ViewModel() 
	{
		_views = new Dictionary(false);
	}
	
	private var _views:Dictionary;
	
	public function getView($value:*):ITimerView
	{
		logger.debug("getView {0}", [String($value)]);
		
		var __class:Class = null;
		if($value is Class) 
		{
			__class = $value;
		}
		else
		{
			__class = getDefinitionByName("org.zengrong.robotlegs2.timer.view."+String($value)) as Class;
		}
		var __className:String = getClassName(__class);
		logger.debug("class name is {0}", [__className]);
		if(_views[__className] is ITimerView)
		{
			logger.debug("the ITimerView {0} is cached", [_views[__className]]);
			return _views[__className] as ITimerView;
		}
		var __view:ITimerView  = new __class as ITimerView;
		if(__view)
		{
			_views[__className] = __view;
		}
		return __view;
	}
	
	private function getClassName($value:Class):String
	{
		var __className:String = String($value).split(" ")[1];
		return __className.slice(0, __className.length - 1);
	}
	
}
}