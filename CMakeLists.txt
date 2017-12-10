cmake_minimum_required(VERSION 3.2)
project(prPractica2)

set(MODE $ENV{mode})
set(TBBROOT ../tbb-2018)
set(SOURCE_FILES main.cpp)

include_directories(${TBBROOT}/include)
add_executable(prPractica2 ${SOURCE_FILES})

link_directories(${TBBROOT}/build/linux_${MODE})
if(${MODE} MATCHES "release")
    target_link_libraries(prPractica2 tbb)
elsif(${MODE} MATCHES "debug")
    target_link_libraries(prPractica2 tbb_debug)
endif()
#link_directories(${TBBROOT}/build/linux_release)