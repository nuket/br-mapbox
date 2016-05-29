################################################################################
#
# qt5location
#
################################################################################

QT5LOCATION_VERSION = $(QT5_VERSION)
QT5LOCATION_SITE = $(QT5_SITE)
QT5LOCATION_SOURCE = qtlocation-opensource-src-$(QT5LOCATION_VERSION).tar.xz
QT5LOCATION_DEPENDENCIES = qt5base
QT5LOCATION_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT5LOCATION_LICENSE = LGPLv2.1 with exception or LGPLv3
QT5LOCATION_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
else
QT5LOCATION_LICENSE = Commercial license
QT5LOCATION_REDISTRIBUTE = NO
endif

define QT5LOCATION_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
endef

define QT5LOCATION_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5LOCATION_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

ifeq ($(BR2_STATIC_LIBS),)

define QT5LOCATION_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Location*.so.* $(TARGET_DIR)/usr/lib
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Positioning*.so.* $(TARGET_DIR)/usr/lib
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
endef

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
	cp -dpfr $(STAGING_DIR)/usr/qml/QtLocation $(TARGET_DIR)/usr/qml/
	cp -dpfr $(STAGING_DIR)/usr/qml/QtPositioning $(TARGET_DIR)/usr/qml/
endef
endif

endif # BR2_STATIC_LIBS

$(eval $(generic-package))