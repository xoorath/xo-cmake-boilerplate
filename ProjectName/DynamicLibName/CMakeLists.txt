project ("DynamicLibName")

set(PROJ_PUBLIC_DIR      Include/  )
set(PROJ_PRIVATE_DIR     Source/ )

file(GLOB_RECURSE PROJ_SOURCE_FILES 
    "${PROJ_PRIVATE_DIR}/*.cpp"
    "${PROJ_PRIVATE_DIR}/*.h"
    "${PROJ_PUBLIC_DIR}/*.cpp"
    "${PROJ_PUBLIC_DIR}/*.h"
)
file(GLOB_RECURSE PROJ_INCLUDE_FILES 
    "${PROJ_PRIVATE_DIR}/*.h"
)

add_library(${PROJECT_NAME} SHARED ${PROJ_SOURCE_FILES})

target_compile_definitions(${PROJECT_NAME} PRIVATE DYNAMICLIBNAME_EXPORT)

target_include_directories(${PROJECT_NAME} PUBLIC ${PROJ_PUBLIC_DIR})
target_include_directories(${PROJECT_NAME} PRIVATE ${PROJ_PRIVATE_DIR})

set_target_properties(${PROJECT_NAME}
    PROPERTIES
    PUBLIC_HEADER "${PROJ_INCLUDE_FILES}"
)

install (TARGETS ${PROJECT_NAME}
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    PUBLIC_HEADER DESTINATION include
)
