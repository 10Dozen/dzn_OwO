class CfgPatches
{
	class dzn_OwO
	{
		units[] = {;
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"CBA_MAIN"};
		author = "10Dozen";
		version = "0.1";
	};
};

class Extended_PostInit_EventHandlers
{
	class dzn_OwO
	{
		init = call compile preprocessFileLineNumbers "\dzn_OwO\init.sqf";
	};
};
