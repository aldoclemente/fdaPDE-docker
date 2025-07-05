FROM archlinux:latest

RUN pacman-key --init
RUN pacman --noconfirm -Sy gcc
RUN pacman --noconfirm -Sy clang
RUN pacman --noconfirm -Syu icu
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
RUN pacman --noconfirm -Sy archlinux-keyring
RUN pacman --noconfirm -Sy ttf-dejavu ttf-liberation
RUN pacman --noconfirm -Sy heaptrack
RUN cd /usr/include && git clone https://github.com/yixuan/LBFGSpp.git

RUN pacman --noconfirm -Sy pkgconf
RUN pacman --noconfirm -Sy libxml2
RUN cd && echo "install.packages(c('Rcpp', 'RcppEigen', 'R6', 'devtools'), repos='https://cran.stat.unipd.it/')" > tmp.R
RUN cd && Rscript tmp.R
RUN cd && rm tmp.R
#RUN cd && git clone --recursive https://github.com/fdaPDE/fdaPDE-R.git
#RUN echo "cd fdaPDE-R && git submodule update --recursive --remote" > update_fdaPDE-R.sh
#RUN chmod +x update_fdaPDE-R.sh

