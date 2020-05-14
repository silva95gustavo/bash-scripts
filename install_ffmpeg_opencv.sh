# FFMPEG
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree \
  --enable-openssl \
  --enable-pic \
  --extra-ldexeflags=-pie && \
PATH="$HOME/bin:$PATH" make -j7 && \
sudo make install && \
hash -r

# OpenCV
cmake \
-D CMAKE_BUILD_TYPE=RelWithDebInfo \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D CMAKE_SHARED_LINKER_FLAGS="-Wl,-Bsymbolic" ..

# If ffmpeg-concat is installed, follow these steps: https://github.com/stackgl/headless-gl/issues/65#issuecomment-252742795
