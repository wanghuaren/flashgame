package com.gamerisker.editor
{
	import com.gamerisker.themes.AeonDesktopTheme;
	import com.gamerisker.utils.GUI;
	
	import feathers.controls.Label;
	import feathers.events.FeathersEventType;
	
	import flash.text.TextFormat;
	
	import mx.collections.ArrayList;
	import mx.utils.ObjectUtil;

	public class LabelEditor extends Editor
	{
		private var m_label : Label;
		private var m_width : int;
		private var m_height : int;
		private var m_color : uint;
		private var m_enabled : Boolean;
		private var m_fontSize : int;
		private var m_align : String;
		private var m_bold : Boolean;
		private var globalTextFormat:TextFormat;
		
		public function LabelEditor()
		{
			m_type = "Label";
			
			m_label = new Label();
			m_label.addEventListener(FeathersEventType.CREATION_COMPLETE , onCreateComponent);
			addChild(m_label);
		}

		override public function create():void
		{
			initGlobalTextFormat();
			
			id = GUI.getInstanteIdNew();
			label = "label";
			width = 150;
			height = 20;
			color = 0x000000;
			fontSize = 12;
			enabled = true;
			align = "left";
			alpha = 1;
			bold = false;
		}
		
		private function initGlobalTextFormat():void{
			if(globalTextFormat==null){
				globalTextFormat=new TextFormat();
				var m_properties_array:Array=ObjectUtil.getClassInfo(AeonDesktopTheme.m_headerTitleTextFormat).properties as Array;
				for each(var m_proper:String in m_properties_array){
					globalTextFormat[m_proper]=AeonDesktopTheme.m_defaultTextFormat[m_proper];
				}
			}
		}
		
		public function get bold():Boolean
		{
			return m_bold;
		}
		
		public function set bold(value:Boolean):void
		{
			m_bold = value;
			globalTextFormat.bold=value;
			
			var m_textFormat:TextFormat=new TextFormat();
			var m_properties_array:Array=ObjectUtil.getClassInfo(globalTextFormat).properties as Array;
			for each(var m_proper:String in m_properties_array){
				m_textFormat[m_proper]=globalTextFormat[m_proper];
			}
			m_label.textRendererProperties.textFormat=m_textFormat;
		}
		
		public function get align():String
		{
			return m_align;
		}
		
		public function set align(value:String):void
		{
			m_align = value;
			globalTextFormat.align=value;
			
			var m_textFormat:TextFormat=new TextFormat();
			var m_properties_array:Array=ObjectUtil.getClassInfo(globalTextFormat).properties as Array;
			for each(var m_proper:String in m_properties_array){
				m_textFormat[m_proper]=globalTextFormat[m_proper];
			}
			m_label.textRendererProperties.textFormat=m_textFormat;
		}
		
		public function get label():String
		{
			return m_label.text;
		}

		public function set label(value:String):void
		{
			m_label.text = value;
		}
		
		override public function get width():Number
		{
			return m_width;
		}

		override public function set width(value:Number):void
		{
			m_width = value;
			m_label.width = value;
		}

		override public function get height():Number
		{
			return m_height;
		}

		override public function set height(value:Number):void
		{
			m_height = value;
			m_label.height = value;
		}

		public function get color():uint
		{
			return m_color;
		}

		public function set color(value:uint):void
		{
			m_color = value;
			globalTextFormat.color=value;
			
			var m_textFormat:TextFormat=new TextFormat();
			var m_properties_array:Array=ObjectUtil.getClassInfo(globalTextFormat).properties as Array;
			for each(var m_proper:String in m_properties_array){
				m_textFormat[m_proper]=globalTextFormat[m_proper];
			}
			m_label.textRendererProperties.textFormat=m_textFormat;
		}

		public function get enabled():Boolean
		{
			return m_enabled;
		}

		public function set enabled(value:Boolean):void
		{
			m_enabled = value;
			m_label.isEnabled = value;
		}

		public function get fontSize():int
		{
			return m_fontSize;
		}

		public function set fontSize(value:int):void
		{
			m_fontSize = value;
			globalTextFormat.size=value;
			
			var m_textFormat:TextFormat=new TextFormat();
			var m_properties_array:Array=ObjectUtil.getClassInfo(globalTextFormat).properties as Array;
			for each(var m_proper:String in m_properties_array){
				m_textFormat[m_proper]=globalTextFormat[m_proper];
			}
			m_label.textRendererProperties.textFormat=m_textFormat;
		}

		override public function set alpha(value:Number):void
		{
			m_label.alpha = value;
		}
		
		override public function get alpha():Number
		{
			return m_label.alpha;
		}

		override public function toCopy():Editor
		{
			var _label : LabelEditor = new LabelEditor();
			_label.xmlToComponent(new XML(toXMLString()));
			_label.id = GUI.getInstanteIdNew();
			return _label;
		}
		
		override public function toXMLString():String
		{
			var xml : String = '<Label id="'
				+id+
				'" color="'
				+color+
				'" label="'
				+label+
				'" fontSize="'
				+fontSize+		
				'" x="'
				+x+
				'" y="'
				+y+
				'" width="'
				+width+
				'" height="'
				+height+
				'" enabled="'
				+enabled+
				'" alpha="'
				+alpha + 
				'" align="'
				+align + 
				'" bold="'
				+bold + 
				'"';
			
			var leng : int = childList.length;
			
			if(leng > 0)
			{
				xml += ">";
			}
			else
			{
				return xml += "/>";
			}
			
			var editor : Editor;
			for(var i:int=0;i<leng;i++)
			{
				editor = childList[i];
				xml += editor.toXMLString();
			}
			
			return xml += '</Label>';
		}
		
		override public function toArrayList():ArrayList
		{
			var list : Array = new Array
			list[0] = {"Name" : "id" , "Value" : id};
			list[1] = {"Name" : "label" , "Value" : label};
			list[2] = {"Name" : "width" , "Value" : width};
			list[3] = {"Name" : "height" , "Value" : height};
			list[4] = {"Name" : "color" , "Value" : "0x"+color.toString(16).toLocaleUpperCase()};
			list[5] = {"Name" : "alpha" , "Value" : alpha};
			list[6] = {"Name" : "x" , "Value" : x};
			list[7] = {"Name" : "y" , "Value" : y};
			list[8] = {"Name" : "fontSize" , "Value" : fontSize};
			list[9] = {"Name" : "enabled" , "Value" : enabled};
			list[10] = {"Name" : "align" , "Value" : align};
			list[11] = {"Name" : "bold" , "Value" : bold};

			return new ArrayList(list);
		}
		
		override public function xmlToComponent(value:XML):Editor
		{
			initGlobalTextFormat();
			id = GUI.getInstanteId(value.@id.toString());
			label = value.@label.toString();
			width = int(value.@width);
			height = int(value.@height);
			color = int(value.@color);
			fontSize = int(value.@fontSize);
			enabled = (value.@enabled.toString() == "true" ? true : false);
			bold = (value.@bold.toString() == "true" ? true : false);
			alpha = Number(value.@alpha);
			x = int(value.@x);
			y = int(value.@y);
			align = value.@align;
			
			return this;
		}
	}
}