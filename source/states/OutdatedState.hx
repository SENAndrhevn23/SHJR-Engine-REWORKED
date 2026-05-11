package states;

class OutdatedState extends MusicBeatState
{
	public static var leftState:Bool = false;

	override function create()
	{
		super.create();

		// SHJR ENGINE:
		// Outdated screen removed completely.
		// Instantly continue to Main Menu.

		MusicBeatState.switchState(new MainMenuState());
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
