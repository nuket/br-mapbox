UNIQUERESOURCEHPP_VERSION = master
UNIQUERESOURCEHPP_SITE = $(call github,okdshin,unique_resource,$(UNIQUERESOURCEHPP_VERSION))
UNIQUERESOURCEHPP_INSTALL_STAGING = YES
UNIQUERESOURCEHPP_LICENSE = Boost
UNIQUERESOURCEHPP_LICENSE_FILES = LICENSE.txt

define UNIQUERESOURCEHPP_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/mapbox
	cp -R $(@D)/unique_resource.hpp $(STAGING_DIR)/usr/include/mapbox
endef

$(eval $(generic-package))
