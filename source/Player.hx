package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Player extends FlxSprite {
	private var _xSpeed : Float = 100;
	private var _ySpeed : Float = 100;

	public function new( ?x: Float = 0, ?y: Float = 0 ) {
		super( x, y );
		loadGraphic( "assets/images/DustBunnySheet.png", true, 95, 126 );
		animation.add( "forward", [ 0, 1, 2 ], 4, true );
		animation.add( "right", [ 3, 4, 5 ], 4, true );
		animation.add( "left", [ 6, 7, 8 ], 4, true );
		animation.play( "forward" );
	}

	public function movement() : Float {
		if ( FlxG.keys.anyPressed([ LEFT, A ])) {
			velocity.x = -_xSpeed;
			animation.play( "left" );
		} else if ( FlxG.keys.anyPressed([ RIGHT, D ])) {
			velocity.x = _xSpeed;
			animation.play( "right" );
		} else {
			velocity.x = 0;
			animation.play( "forward" );
		}

		return _ySpeed;
	}

	override public function update( elapsed : Float ) : Void {

		super.update( elapsed );
	}
}