/*
	Name: fnc_clearGlasses.sqf

	Author: Garth de Wet (LH)

	Description:
	Clears all dirt, rain, dust from glasses.
	Removes glasses effect (PP, overlay) and then puts it back.

	Parameters:
	Nothing

	Returns:
	Nothing

	Example:
	call FUNC(ClearGlasses);
*/
#include "script_component.hpp"

private "_broken";
_broken = GETBROKEN;
_effects = GLASSESDEFAULT;
_effects set [BROKEN, _broken];
SETGLASSES(ace_player,_effects);

if ((stance ace_player) != "PRONE") then {
	ace_player playActionNow "gestureWipeFace";
};
[{
	if (cameraView == "INTERNAL") then {
		addCamShake [5, 1.75, 2];
	};
}, [], 0.3, 0] call EFUNC(common,waitAndExecute);

call FUNC(removeDirtEffect);
call FUNC(removeRainEffect);
call FUNC(removeDustEffect);