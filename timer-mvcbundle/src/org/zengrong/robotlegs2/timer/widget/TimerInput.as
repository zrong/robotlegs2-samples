package org.zengrong.robotlegs2.timer.widget 
{
import com.bit101.components.InputText;
import com.bit101.components.Label;
import com.bit101.components.PushButton;
import com.bit101.components.Text;
import com.bit101.components.VBox;
import flash.events.Event;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

/**
 * 设置计时器时间
 * @author zrong (http://zengrong.net)
*/
public class TimerInput extends VBox 
{
	public function TimerInput() 
	{
		init();
		addChildren();
	}
	
	private var _ti:InputText;
	private var _increaseBtn:PushButton;
	private var _decreaseBtn:PushButton;
	private var _label:Label;
	
	private var _max:int = 99;
	
	public function get max():int
	{
		return _max;
	}
	
	public function set max($value:int):void
	{
		_max = $value;
	}
	
	private var _min:int = 0;
	
	private function init():void
	{
		_ti = new InputText(this, 0, 0, "10", handler_change);
		_ti.width = 30;
		_ti.textField.restrict = "0-9";
		_ti.textField.maxChars = 2;
		_ti.textField.defaultTextFormat = new TextFormat(null, null, null, null, null, null, null, null, TextFormatAlign.CENTER);
		_increaseBtn = new PushButton(this, 0, 0, "+", handler_increaseTime);
		_increaseBtn.width = 30;
		_decreaseBtn = new PushButton(this, 0, 0, "-", handler_deceaseTime);
		_decreaseBtn.width = 30;
		_label = new Label(this);
		this.alignment = CENTER;
		this.spacing = 10;
	}
	
	private function addChildren():void
	{
		this.addChild(_increaseBtn);
		this.addChild(_ti);
		this.addChild(_decreaseBtn);
		this.addChild(_label);
	}
	
	public function get label():String
	{
		return _label.text;
	}
	
	public function set label($txt:String):void
	{
		_label.text = $txt;
	}
	
	public function get value():int
	{
		return int(_ti.text);
	}
	
	public function set value($value:int):void
	{
		var __value:int = $value;
		if (__value > max) __value = max;
		if (__value < min) __value = min;
		_ti.text = __value.toString();
	}
	
	public function get min():int 
	{
		return _min;
	}
	
	public function set min($value:int):void 
	{
		_min = $value;
	}
	
	private function handler_deceaseTime($evt:Event):void 
	{
		value --;
	}
	
	private function handler_increaseTime($evt:Event):void 
	{
		value ++;
	}
	
	private function handler_change($evt:Event):void 
	{
		
	}
}
}