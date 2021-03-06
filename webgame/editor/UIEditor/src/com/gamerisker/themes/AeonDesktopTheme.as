/*
 Copyright (c) 2014 Josh Tynjala

 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:

 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 */
package com.gamerisker.themes
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.text.TextFormat;
	
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	/**
	 * The "Aeon" theme for desktop Feathers apps.
	 *
	 * <p>This version of the theme embeds its assets. To load assets at
	 * runtime, see <code>AeonDesktopThemeWithAssetManager</code> instead.</p>
	 *
	 * @see http://wiki.starling-framework.org/feathers/theme-assets
	 */
	public class AeonDesktopTheme extends BaseAeonDesktopTheme
	{
		[Embed(source="/source/UISource/images/aeon_desktop.png")]
		protected static const ATLAS_BITMAP:Class;

		[Embed(source="/source/UISource/images/aeon_desktop.xml",mimeType="application/octet-stream")]
		protected static const ATLAS_XML:Class;
		public static var m_headerTitleTextFormat:TextFormat;
		public static var m_defaultTextFormat:TextFormat;
		public function AeonDesktopTheme()
		{
			super();
			this.initialize();
			this.dispatchEventWith(Event.COMPLETE);
		}

		override protected function initialize():void
		{
			var atlasBitmapData:BitmapData = Bitmap(new ATLAS_BITMAP()).bitmapData;
			this.atlasTexture = Texture.fromBitmapData(atlasBitmapData, false);
			this.atlasTexture.root.onRestore = this.atlasTexture_onRestore;
			atlasBitmapData.dispose();
			this.atlas = new TextureAtlas(atlasTexture, XML(new ATLAS_XML()));
			m_headerTitleTextFormat=headerTitleTextFormat;
			m_defaultTextFormat=defaultTextFormat;
			super.initialize();
		}

		protected function atlasTexture_onRestore():void
		{
			var atlasBitmapData:BitmapData = Bitmap(new ATLAS_BITMAP()).bitmapData;
			this.atlasTexture.root.uploadBitmapData(atlasBitmapData);
			atlasBitmapData.dispose();
		}
	}
}
