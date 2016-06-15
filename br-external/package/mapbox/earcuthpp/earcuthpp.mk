EARCUTHPP_VERSION = v0.11
EARCUTHPP_SITE = $(call github,mapbox,earcut.hpp,$(EARCUTHPP_VERSION))
EARCUTHPP_INSTALL_STAGING = YES
EARCUTHPP_LICENSE = MIT
EARCUTHPP_LICENSE_FILES = LICENSE

define EARCUTHPP_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/mapbox
	cp -R $(@D)/include/* $(STAGING_DIR)/usr/include/mapbox
endef

$(eval $(generic-package))
