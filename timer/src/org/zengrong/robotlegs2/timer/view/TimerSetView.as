package org.zengrong.robotlegs2.timer.view 
{
import com.bit101.components.HBox;
import com.bit101.components.PushButton;
import com.bit101.components.VBox;
import flash.display.Sprite;
import org.zengrong.robotlegs2.timer.widget.TimerInput;
import robotlegs.bender.framework.api.ILogger;

/**
 * 显示Timer界面，该界面可以设置倒计时分、秒
 * @author zrong (http://zengrong.net)
*/
public class TimerSetView extends VBox implements ITimerView
{
	
	public function TimerSetView() 
	{
		init();
		addChildren();
	}
	
	private var _widgetContainer:HBox;
	private var _minuteWidget:TimerInput;
	private var _secondWidget:TimerInput;
	
	private var _startBtn:PushButton;
	
	public function get startBtn():PushButton
	{
		return _startBtn;
	}
	
	private function init():void
	{
		_widgetContainer = new HBox();
		_widgetContainer.spacing = 30;
		_minuteWidget = new TimerInput();
		_secondWidget = new TimerInput();
		_secondWidget.max = 59;
		
		_startBtn = new PushButton();
		_startBtn.label = "Start";
		
		this.alignment = CENTER;
		this.spacing = 10;
	}
	
	private function addChildren():void
	{
		_widgetContainer.addChild(_minuteWidget);
		_widgetContainer.addChild(_secondWidget);
		this.addChild(_widgetContainer);
		
		this.addChild(_startBtn);
	}
	
	public function get minute():int
	{
		return _minuteWidget.value;
	}
	
	public function get second():int
	{
		return _secondWidget.value;
	}

}
}