#!/usr/bin/env bash

[ -z "$GOARCH" ] && export GOARCH="amd64"
[ -z "$GOOS" ] && export GOOS="windows"


if [ "$GOOS" == "windows" ]; then
    echo windows
    # Set toolchain according to GOARCH variable
    case "$GOARCH" in
    amd64)
        export CXX_FOR_TARGET=x86_64-w64-mingw32-g++
        export CC_FOR_TARGET=x86_64-w64-mingw32-gcc
        export CXX=x86_64-w64-mingw32-g++
        export CC=x86_64-w64-mingw32-gcc
        ;;
    386)
        export CXX_FOR_TARGET=i686-w64-mingw32-g++
        export CC_FOR_TARGET=i686-w64-mingw32-gcc
        export CXX=i686-w64-mingw32-g++
        export CC=i686-w64-mingw32-gcc
        ;;
    arm64)
        export CXX_FOR_TARGET=aarch64-w64-mingw32-g++
        export CC_FOR_TARGET=aarch64-w64-mingw32-gcc
        export CXX=aarch64-w64-mingw32-g++
        export CC=aarch64-w64-mingw32-gcc
        ;;
    *)
        echo "Unsupported GOARCH variable value '$GOARCH'. Please set GOARCH environment variable to 'amd64', 'arm64' or '386'"
        exit 2
        ;;
    esac
    
elif [ "$GOOS" == "linux" ]; then
    echo linux

    case "$GOARCH" in
    amd64)
        export CXX_FOR_TARGET=x86_64-linux-gnu-cpp
        export CC_FOR_TARGET=x86_64-linux-gnu-gcc
        export CXX=x86_64-linux-gnu-cpp
        export CC=x86_64-linux-gnu-gcc
        ;;
    386)
        export CXX_FOR_TARGET=i686-linux-gnu-cpp
        export CC_FOR_TARGET=i686-linux-gnu-gcc
        export CXX=i686-linux-gnu-cpp
        export CC=i686-linux-gnu-gcc
        ;;
    arm64)
        export CXX_FOR_TARGET=aarch64-linux-gnu-cpp
        export CC_FOR_TARGET=aarch64-linux-gnu-gcc
        export CXX=aarch64-linux-gnu-cpp
        export CC=aarch64-linux-gnu-gcc
        ;;
    *)
        echo "Unsupported GOARCH variable value '$GOARCH'. Please set GOARCH environment variable to 'amd64', 'arm64' or '386'"
        exit 2
        ;;
    esac

    
else 
    echo "Unsupported GOOS variable value '$GOOS'. Please set GOOS environment variable to 'windows' or 'linux'"
    
fi


"$@"
