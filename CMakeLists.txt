cmake_minimum_required(VERSION 3.4)
project(GTKSwift)

include_directories(/usr/include/gtk-3.0/)

set(SOURCE_FILES
    Sources/GTKSwift/Application.swift
    Sources/GTKSwift/Button.swift
    Sources/GTKSwift/ButtonBox.swift
    Sources/GTKSwift/Signal.swift
    Sources/GTKSwift/Widget.swift
    Sources/GTKSwift/Window.swift
    Sources/GTKSwiftDemo/main.swift
    Package.swift)

add_custom_target(
        COMMAND /usr/bin/swift build
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES ${SOURCE_FILES})
