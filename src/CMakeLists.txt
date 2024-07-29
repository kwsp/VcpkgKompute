set(EXE_NAME main)

add_executable(${EXE_NAME}
  main.cpp
)

set_target_properties(${EXE_NAME} PROPERTIES
    CXX_STANDARD 20
    CXX_EXTENSIONS OFF
)

find_package(fmt CONFIG REQUIRED)
find_package(kompute CONFIG REQUIRED)

# vulkan_compile_shader(
#     INFILE shader/my_shader.comp
#     OUTFILE shader/my_shader.hpp
#     NAMESPACE "shader")

target_link_libraries(${EXE_NAME} PRIVATE
  fmt::fmt
  # shader
  kompute::kompute
)