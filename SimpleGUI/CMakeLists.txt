
INCLUDE_DIRECTORIES(
    ${BULLET_PHYSICS_SOURCE_DIR}/src
    ${BULLET_PHYSICS_SOURCE_DIR}/examples
    ${BULLET_PHYSICS_SOURCE_DIR}/examples/SharedMemory
    ${BULLET_PHYSICS_SOURCE_DIR}/examples/ThirdPartyLibs
    ${BULLET_PHYSICS_SOURCE_DIR}/examples/ThirdPartyLibs/glad
)
# ADD_DEFINITIONS(-DSTATIC_LINK_SPD_PLUGIN)



SET(Bullet3SimpleGui_SRCS 
    ${BULLET_PHYSICS_SOURCE_DIR}/build3/bullet.rc
    ../examples/ExampleBrowser/OpenGLGuiHelper.cpp
    ../examples/ExampleBrowser/GL_ShapeDrawer.cpp
    ../examples/ExampleBrowser/CollisionShape2TriangleMesh.cpp
    ../examples/Utils/b3Clock.cpp

)


# set(BulletRobotics_INCLUDES
# ${BulletRobotics_INCLUDES}
# ${BulletRobotics_ENET_INCLUDES}
# )

ADD_DEFINITIONS(-DPHYSICS_SERVER_DIRECT)


ADD_LIBRARY(Bullet3SimpleGui ${Bullet3SimpleGui_SRCS})
ADD_DEFINITIONS(-DB3_USE_STANDALONE_EXAMPLE)

TARGET_LINK_LIBRARIES(Bullet3SimpleGui BulletSoftBody BulletDynamics BulletCollision LinearMath Bullet3Common OpenGLWindow)


INSTALL (
DIRECTORY ${CMAKE_SOURCE_DIR}/examples/
DESTINATION include/bullet
FILES_MATCHING PATTERN "*.h*")

INSTALL(TARGETS
Bullet3SimpleGui
    LIBRARY DESTINATION lib${LIB_SUFFIX}
    ARCHIVE DESTINATION lib${LIB_SUFFIX}
)
	

IF(NOT MSVC)
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/bullet3_simple_gui.pc.cmake
               ${CMAKE_CURRENT_BINARY_DIR}/bullet3_simple_gui.pc @ONLY)
  INSTALL(
  FILES
  ${CMAKE_CURRENT_BINARY_DIR}/bullet3_simple_gui.pc
  DESTINATION
  ${PKGCONFIG_INSTALL_PREFIX}
)
ENDIF(NOT MSVC)

