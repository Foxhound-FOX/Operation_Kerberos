/*
    Author: Dorbedo

    Description:
        Sets teleport buttons

*/
#include "script_component.hpp"
SCRIPT(onLoad);
CHECK(!hasInterface)
Private["_teleporter","_ctrl"];
disableSerialization;
_teleporter = [
    /// ["",""],      /// Beispiel zum Ausschalten von einem Teleport
    [localize LSTRING(TELEPORT_BASE),QUOTE(closeDialog 600300;player setposatl (getMarkerPos GVARMAIN(RESPAWNMARKER)))],
    [localize LSTRING(TELEPORT_VEHICLES),QUOTE(closeDialog 600300;player setposatl (getMarkerPos 'teleport_fahrzeuge'))],
    [localize LSTRING(TELEPORT_AIR),QUOTE(closeDialog 600300;player setposatl (getMarkerPos 'teleport_luftwaffe'))],
    [localize LSTRING(TELEPORT_SHOOTINGRANGE),QUOTE(closeDialog 600300;player setposatl (getMarkerPos 'teleport_schiessstand'))],
    [localize LSTRING(TELEPORT_MARINE),QUOTE(closeDialog 600300;player setposatl (getMarkerPos 'teleport_hafen'))],
    [localize LSTRING(TELEPORT_LOGISTIC),QUOTE(closeDialog 600300;player setposatl (getMarkerPos 'teleport_logistik'))],
    [localize LSTRING(TELEPORT_LEAD),QUOTE(closeDialog 600300;[ObjNull,player] call FUNC(teleport_lead))]
];

for "_i" from 0 to 6 do {
    _ctrl = (findDisplay 600300 displayCtrl (600301 + _i));
    if (((_teleporter select _i)select 0) isEqualTo "") then {
        _ctrl ctrlSetText "";
        _ctrl ctrlShow false;
        _ctrl ctrlSetEventHandler ["ButtonClick",""];
        _ctrl ctrlSetTooltip "";
    }else{
        _ctrl ctrlSetText ((_teleporter select _i)select 0);
        _ctrl ctrlShow true;
        _ctrl buttonSetAction format["%1",((_teleporter select _i)select 1)];
        _ctrl ctrlSetTooltip "";
    };
};