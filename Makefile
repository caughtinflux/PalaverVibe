include theos/makefiles/common.mk

TWEAK_NAME = PalaverVibe
PalaverVibe_FILES = Tweak.xm
PalaverVibe_FRAMEWORKS = Foundation AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk
