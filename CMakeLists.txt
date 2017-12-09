cmake_minimum_required(VERSION 3.8)
project(prPractica2)

set(DEBUG_MODE 1)
set(TBBROOT ~/bin/tbb-2018)
set(SOURCE_FILES main.cpp)

include_directories(${TBBROOT}/include)
add_executable(prPractica2 ${SOURCE_FILES})

link_directories(${TBBROOT}/build/linux_intel64_gcc_cc4.8_libc2.19_kernel4.1.39_debug)
target_link_libraries(prPractica2 tbb_debug)
#link_directories(${TBBROOT}/build/linux_intel64_gcc_cc4.8_libc2.19_kernel4.1.39_release)
#target_link_libraries(prPractica2 tbb)
