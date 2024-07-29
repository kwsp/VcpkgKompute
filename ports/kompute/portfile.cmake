vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/KomputeProject/kompute/archive/refs/tags/v0.9.0.tar.gz"
    FILENAME "kompute-0.9.0.tar.gz"
    SHA512 6ab912697bf78066497762d69901362595f6e212809a28a5d542bae83e0a31cd1c40877d4799de594df70fe98de1d0cb029023c3f9f4374baccc8788bbb64263
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DKOMPUTE_OPT_USE_BUILT_IN_VULKAN_HEADER=OFF
        -DKOMPUTE_OPT_USE_BUILT_IN_FMT=OFF
        -DKOMPUTE_OPT_DISABLE_VULKAN_VERSION_CHECK=ON # Tmp fix for mac
        -DKOMPUTE_OPT_INSTALL=ON
)

vcpkg_cmake_install()

# vcpkg_cmake_config_fixup(PACKAGE_NAME "kompute")

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# Copy the CMake helper script to the appropriate directory
# file(COPY "${SOURCE_PATH}/cmake/vulkan_shader_compiler.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}/cmake")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
