#include "macro.hpp"

GVAR(Mapping) = [];

if (GVAR(ApplyToVanilla)) then {
	GVAR(Mapping) append [
		#include "bundles\bundleTable_Uniform_A3.h" 
		,
		#include "bundles\bundleTable_Headgear_A3.h"
		,
		#include "bundles\bundleTable_Goggles_A3.h"
	];
};

if (GVAR(ApplyToCUP)) then {
	GVAR(Mapping) append [
		#include "bundles\bundleTable_Uniform_CUP.h" 
		,
		#include "bundles\bundleTable_Headgear_CUP.h"
		,
		#include "bundles\bundleTable_Goggles_CUP.h"
	];
};

if (GVAR(ApplyToRHS)) then {
	GVAR(Mapping) append [
		/*
		#include "bundleTable_Uniform_RHS.h" 
		,*/
		#include "bundles\bundleTable_Headgear_RHS.h"
		,
		#include "bundles\bundleTable_Goggles_RHS.h"
	];
};

if (GVAR(ApplyToYuE)) then {
	GVAR(Mapping) append [
		#include "bundles\bundleTable_Uniform_YuEmod.h" 
		,
		#include "bundles\bundleTable_Headgear_YuEmod.h" 
		,
		#include "bundles\bundleTable_Goggles_YuEmod.h"
	];
};

GVAR(Mapping) append [
	#include "bundles\bundleTable_Pointers.h"
];

if !(GVAR(ExtraMappingSettings) isEqualTo "") then {
	GVAR(Mapping) append (call compile ("[" + GVAR(ExtraMappingSettings) + "]"));
};


GVAR(StringShortcuts) = [
	 "CHNG", localize "STR_OwO_CHNG"
	,"CHNG_", localize "STR_OwO_CHNG_"

	/* Uniform */
	,"F", localize "STR_OwO_F"
	,"F_", localize "STR_OwO_F_"

	,"R", localize "STR_OwO_R"
	,"R_", localize "STR_OwO_R_"

	,"R2", localize "STR_OwO_R2"
	,"R2_", localize "STR_OwO_R2_"

	,"RG", "Rolled up/Gloves"
	,"RG_", "Sleeves was rolled up and gloves was put on"

	,"RG2", "Rolled up/Gloves (High)"
	,"RG2_", "Sleeves was rolled up high and gloves was put on"

	,"RJ", localize "STR_OwO_RJ"
	,"RJ_", localize "STR_OwO_RJ_"

	,"H", localize "STR_OwO_H"
	,"H_", localize "STR_OwO_H_"

	,"HOff", localize "STR_OwO_HOff"
	,"HOff_", localize "STR_OwO_HOff_"

	,"G", localize "STR_OwO_G"
	,"G_", localize "STR_OwO_G_"

	,"K", localize "STR_OwO_K"
	,"K_", localize "STR_OwO_K_"

	,"GK", "Gloves/Kneepads"
	,"GK_", "Gloves and kneepads were put on"

	,"K1", "1 kneepad"
	,"K1_", "Single kneepad was put on"

	,"KR1", "Rolled up/1 kneepad"
	,"KR1_", "Rolled up and single kneepad was put on"

	,"KR2", "Rolled up/kneepads"
	,"KR2_", "Rolled up and kneepads was put on"

	,"RJK", "No jacket/kneepads"
	,"RJK_", "Jacket was removed and kneepads was put on"

	,"GO", "Gloves only"
	,"GO_", "Gloves only was put on"

	,"CU", localize "STR_OwO_CU"
	,"CU_", localize "STR_OwO_CU_"

	,"CD", localize "STR_OwO_CD"
	,"CD_", localize "STR_OwO_CD_"

	,"BU", localize "STR_OwO_BU"
	,"BU_", localize "STR_OwO_BU_"

	,"UB", localize "STR_OwO_BD"
	,"UB_", localize "STR_OwO_BD_"

	/* Headgear */
	,"RM", "Remove mask"
	,"RM_", "Mask was removed"
	
	,"OM", localize "STR_OwO_OM"
	,"OM_", localize "STR_OwW_OM_"
	
	,"CM", localize "STR_OwO_CM"
	,"CM_", localize "STR_OwW_CM_"

	,"AM", "Attach mask"	
	,"AM_", "Mask was attached"
	
	,"HF", "Headphones on"
	,"HF_", "Headphones were put on"

	,"HF1", "Headphones on (alt)"
	,"HF1_", "Headphones (alt) were put on"

	,"HFG", "Headphones/Goggles"
	,"HFG_", "Headphones & goggles were put on"

	,"HFA", "Headphones/Acc."
	,"HFA_", "Headphones and accessories were put on"

	,"PB", "Backward"
	,"PB_", "Cap was put backward"

	,"PBHF", "Backward /Headphones"
	,"PBHF_", "Cap was put backward and headphones put on"

	,"VD", "Visor down"
	,"VD_", "Visor was put down"

	,"VU", "Visor up"
	,"VU_", "Visor was put up"

	,"VDM", "Mask/Visor down"
	,"VDM_", "Mask/Visor was put down"
	
	/* Accessories */
	,"GL1", "Goggles"	
	,"GL1_", "Google put on"

	,"GL2", "Goggles (alt)"
	,"GL2_", "Google (alt) put on"

	,"GL3", "Goggles (alt 2)"
	,"GL3_", "Google (alt 2) put on"

	,"RMG", "No mask/Googles"
	,"RMG_", "Mask was removed and goggles was put on"

	/* Pointer */
	,"S", "Side mount"
	,"S_", "Item mounted at side rail"

	,"T", "Top mount"
	,"T_", "Item mounted at top rail"

	,"S2S", "Side to side"
	,"S2S_", "Items mounted side to side"

	,"Cross", "Cross side"
	,"Cross_", "Items mounted cross side"
];