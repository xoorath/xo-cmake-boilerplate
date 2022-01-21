project (ExecutableName)

set(PROJ_PRIVATE_DIR     Source/ )

file(GLOB_RECURSE PROJ_SOURCE_FILES 
    "${PROJ_PRIVATE_DIR}/*.cpp"
    "${PROJ_PRIVATE_DIR}/*.h"
)

add_executable(${PROJECT_NAME} ${PROJ_SOURCE_FILES})

target_link_libraries(${PROJECT_NAME} DynamicLibName stb_image)