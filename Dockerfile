FROM archlinux:latest

RUN pacman --noconfirm -Sy gcc
RUN pacman --noconfirm -Sy clang
RUN pacman --noconfirm -Sy icu
RUN pacman --noconfirm -Sy make
RUN pacman --noconfirm -Sy cmake
RUN pacman --noconfirm -Sy git
RUN pacman --noconfirm -Sy libxml2
RUN pacman --noconfirm -Sy freetype2
RUN pacman --noconfirm -Sy harfbuzz
RUN pacman --noconfirm -Sy fribidi
RUN pacman --noconfirm -Sy libtiff
RUN pacman --noconfirm -Sy eigen
RUN pacman --noconfirm -Sy python3
RUN pacman --noconfirm -Sy r-base
RUN pacman --noconfirm -Sy nano
RUN pacman --noconfirm -Sy gtest
RUN pacman --noconfirm -Sy valgrind
RUN pacman --noconfirm -Sy openmpi


