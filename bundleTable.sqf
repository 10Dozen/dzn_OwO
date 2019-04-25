#include "macro.hpp"

GVAR(Uniforms) = [
	#include "bundleTable_Uniform_A3.h"
	,
	 #include "bundleTable_Uniform_CUP.h"
];

GVAR(Headgear) = [
	#include "bundleTable_Headgear_A3.h"
	, 
	#include "bundleTable_Headgear_CUP.h"
];

GVAR(Accessories) = [
	#include "bundleTable_Goggles_A3.h"
	, 
	#include "bundleTable_Goggles_CUP.h"
];

GVAR(StringShortcuts) = [
	 "CHNG", "Change"
	,"CHNG_", "Changed"

	/* Uniform */
	,"F", "Fix"
	,"F_", "Fixed"

	,"R", "Roll up"
	,"R_", "Sleeves was rolled up"

	,"R2", "Roll up high"
	,"R2_", "Sleeves was rolled up high"

	,"RG", "Roll up/Gloves"
	,"RG_", "Sleeves was rolled up and gloves was put on"

	,"RG2", "Roll up/Gloves (High)"
	,"RG2_", "Sleeves was rolled up high and gloves was put on"

	,"RJ", "Remove jacket"
	,"RJ_", "Jacked was removed"

	,"H", "Hood put on"
	,"H_", "Hood was put on"

	,"G", "Gloves put on"
	,"G_", "Gloves were put on"

	,"K", "Kneepads put on"
	,"K_", "Kneepads were put on"

	,"GK", "Gloves/Kneepads"
	,"GK_", "Gloves and kneepads were put on"

	,"K1", "1 kneepad"
	,"K1_", "Single kneepad was put on"

	,"KR1", "Roll up/1 kneepad"
	,"KR1_", "Rolled up and single kneepad was put on"

	,"KR2", "Roll up/kneepads"
	,"KR2_", "Rolled up and kneepads was put on"

	,"RJK", "No jacket/kneepads"
	,"RJK_", "Jacket was removed and kneepads was put on"

	,"GO", "Gloveso only"
	,"GO_", "Gloves only was put on"


	/* Headgear */
	,"RM", "Remove mask"
	,"RM_", "Mask was removed"

	,"AM", "Attach mask"	
	,"AM_", "Mask was attached"
	
	,"HF", "Headphones on"
	,"HF_", "Headphones were put on"

	,"HF1", "Headphones on (alt)"
	,"HF1_", "Headphones (alt) were put on"

	,"PB", "Put back"
	,"PB_", "Cap was put backward"

	,"PBHF", "Put back/Headphones"
	,"PBHF_", "Cap was put backward and headphones put on"
	
	/* Accessories */
	,"GL1", "Goggles 1"	
	,"GL1_", "Google 1 put on"

	,"GL2", "Goggles 2"
	,"GL2_", "Google 2 put on"

	,"GL3", "Goggles 3"
	,"GL3_", "Google 3 put on"
];