package org.zengrong.robotlegs2.timer.view 
{
import com.bit101.components.HBox;
import com.bit101.components.Label;
import com.bit101.components.PushButton;
import com.bit101.components.VBox;
import flash.utils.setTimeout;
import mx.core.ButtonAsset;
	
/**
 * 计时器在运行时的视图
 * @author zrong (http://zengrong.net)
*/
public class TimerActionView extends VBox implements ITimerView
{
	
	public function TimerActionView() 
	{
		init();
		addChildren();
	}
	
	private var _hbox:HBox;
	private var _minute:Label;
	private var _second:Label;
	private var _colon:Label;
	
	private var _cancelBtn:PushButton;
	
	public function get cancelBtn():PushButton
	{
		return _cancelBtn;
	}
	
	private function init():void
	{
		_hbox = new HBox();
		_minute = new Label(_hbox);
		_minute.width = 30;
		_colon = new Label(_hbox, 0, 0, ":");
		_colon.width = 20;
		_second = new Label(_hbox);
		_second.width = 30;

		
		_cancelBtn = new PushButton();
		_cancelBtn.label = "Cancel";
		
		this.alignment = VBox.CENTER;
	}
	
	private function addChildren():void
	{
		this.addChild(_hbox);
		this.addChild(_cancelBtn);
	}
	
	public function updateTimer($min:int, $second:int):void
	{
		_minute.text = ($min<10)?("0"+$min):$min.toString();
		_second.text = ($second<10)?("0"+$second):$second.toString();
	}
	
}
}