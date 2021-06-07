ifeq ($(CUSTOM_MAINTAINER),)
    $(error If you are OFFICIAL, you need to define the variable with your name in your device tree, for example: CUSTOM_MAINTAINER := MyName)
endif
