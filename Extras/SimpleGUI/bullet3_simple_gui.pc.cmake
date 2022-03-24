Name: bullet3_simple_gui
Description: Bullet extras that include several utilities for robotics including a urdf parser
Requires: bullet
Version: @BULLET_VERSION@
Libs: -L@CMAKE_INSTALL_PREFIX@/@LIB_DESTINATION@ -lBullet3SimpleGui
Cflags: @BULLET_DOUBLE_DEF@ -I@CMAKE_INSTALL_PREFIX@/@INCLUDE_INSTALL_DIR@ -I@CMAKE_INSTALL_PREFIX@/include/bullet3_simple_gui
