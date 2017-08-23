/*
 *  Author: Dorbedo
 *
 *  Description:
 *      Attacks a position with mortar
 *
 *  Parameter(s):
 *      0 : LOCATION - Attacklocation
 *
 *  Returns:
 *      none
 *
 */
#include "script_component.hpp"

_this params ["_attackLoc"];
//TRACEV_1(_attackLoc);
private _pos = locationPosition _attackLoc;
private _targetPos = _pos;

private _nearPlayers = allPlayers select { ((_x distance _pos)<300) && (!((vehicle _x) isKindOf "Air")) && {side _x == GVARMAIN(playerside)} };

private _amount = floor(((count _nearPlayers) * 1.5) max 5);
If !(_nearPlayers isEqualTo []) then {
    _targetPos = getPosATL (selectRandom _nearPlayers);
};

[_targetPos,1,_amount] call FUNC(fdc_placeOrder);
