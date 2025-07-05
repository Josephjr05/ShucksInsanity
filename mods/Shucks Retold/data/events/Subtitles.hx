import openfl.text.TextFormat;
import flixel.text.FlxText.FlxTextBorderStyle;

var theTxt:FlxText;
var size = 32;

function create() {
	theTxt = new FlxText(640, 400, 5000, "", 32);
	theTxt.screenCenter();

	capBG = new FlxSprite(0, 0);
	capBG.makeGraphic(1, 32, FlxColor.BLACK);
	capBG.camera = camHUD;
	add(capBG);

	FUCK = new FlxSprite(100,50);
	FUCK.makeGraphic(2, 2, FlxColor.BLACK);
	FUCK.camera = camHUD;
	add(FUCK);

	theTxt.y = 338 + (downscroll ? -200 : 200);

	theTxt.alignment = "center";
	theTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	theTxt.camera = camHUD;
	add(theTxt);

	capBG.screenCenter();
	capBG.y = theTxt.y;
	capBG.visible = false;
}

function onEvent(e) {
	if (e.event.name != 'Subtitles') return;

	capBG.visible = true;
	theTxt.text = e.event.params[0];
	capBG.scale.x = theTxt.text.length * 16;
}