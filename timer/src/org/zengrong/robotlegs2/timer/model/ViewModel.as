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
		if(_views[$value] is ITimerView)
		{
			return _views[$value] as ITimerView;
		}
		var __class:Class = null;
		if($value is Class) 
		{
			__class = $value;
		}
		else
		{
			__class = getDefinitionByName("org.zengrong.robotlegs2.timer.view."+String($value)) as Class;
		}
		var __view:ITimerView  = new __class as ITimerView;
		if(__view)
		{
			_views[$value] = __view;
		}
		return __view;
	}
	
}
}