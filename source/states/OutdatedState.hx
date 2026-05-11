package states;

class OutdatedState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;

	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(
			FlxG.width,
			FlxG.height,
			FlxColor.BLACK
		);
		add(bg);

		var message:String;

		if (controls.mobileC)
		{
			message =
			"SHJR ENGINE UPDATE AVAILABLE\n\n" +
			"Current Version: " + MainMenuState.shjrVersion + "\n" +
			"Latest Version: " + TitleState.updateVersion + "\n\n" +
			"Press B to continue anyway\n" +
			"Press ACCEPT to open updates page.";
		}
		else
		{
			message =
			"SHJR ENGINE UPDATE AVAILABLE\n\n" +
			"Current Version: " + MainMenuState.shjrVersion + "\n" +
			"Latest Version: " + TitleState.updateVersion + "\n\n" +
			"Press ESCAPE to continue anyway\n" +
			"Press ENTER to open updates page.";
		}

		warnText = new FlxText(0, 0, FlxG.width, message, 32);
		warnText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter();
		warnText.antialiasing = ClientPrefs.data.antialiasing;
		add(warnText);

		#if TOUCH_CONTROLS_ALLOWED
		addTouchPad('NONE', 'A_B');
		#end
	}

	override function update(elapsed:Float)
	{
		if(!leftState)
		{
			// Open SHJR releases
			if (controls.ACCEPT)
			{
				leftState = true;
				CoolUtil.browserLoad(
					"https://github.com/SENAndrhevn23/SHJR-Engine-REWORKED/releases"
				);
			}
			else if (controls.BACK)
			{
				leftState = true;
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'), ClientPrefs.data.sfxVolume);

				FlxTween.tween(warnText, {alpha: 0}, 1,
				{
					onComplete: function(twn:FlxTween)
					{
						MusicBeatState.switchState(new MainMenuState());
					}
				});
			}
		}

		super.update(elapsed);
	}
}