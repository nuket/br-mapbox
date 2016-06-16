MAPBOXGLSHADERS_VERSION = master
MAPBOXGLSHADERS_SITE = $(call github,mapbox,mapbox-gl-shaders,$(MAPBOXGLSHADERS_VERSION))
MAPBOXGLSHADERS_INSTALL_STAGING = YES
MAPBOXGLSHADERS_LICENSE = MIT
MAPBOXGLSHADERS_LICENSE_FILES = LICENSE

define MAPBOXGLSHADERS_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(@D)/node_modules/mapbox-gl-shaders
	# cp -R $(@D)/include/* $(STAGING_DIR)/usr/include/mapbox
endef

$(eval $(generic-package))
