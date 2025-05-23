# Some procedures to install netcdf-fortran-4.6.0

$ cd /home/augusto.pereira/BUILD_WRF/LIBRARIES

$ wget https://downloads.unidata.ucar.edu/netcdf-fortran/4.6.0/netcdf-fortran-4.6.0.tar.gz
$ tar -xzf netcdf-fortran-4.6.0.tar.gz
$ cd netcdf-fortran-4.6.0

$ export NETCDF=/home/augusto.pereira/BUILD_WRF/LIBRARIES/netcdf
$ export HDF5=/home/augusto.pereira/BUILD_WRF/LIBRARIES/hdf5

$ export CPPFLAGS="-I$NETCDF/include -I$HDF5/include"
$ export LDFLAGS="-L$NETCDF/lib -L$HDF5/lib"
$ export LD_LIBRARY_PATH="$NETCDF/lib:$HDF5/lib:$LD_LIBRARY_PATH"
$ export PATH="$NETCDF/bin:$HDF5/bin:$PATH"

$ export CC=gcc
$ export CXX=g++
$ export FC=gfortran
$ export F77=gfortran
$ export F90=gfortran

$ export LIBS="-lnetcdf -lhdf5_hl -lhdf5"

$ cd /home/augusto.pereira/BUILD_WRF/LIBRARIES/netcdf-fortran-4.6.0
$ make clean
$ make distclean

$ ./configure --prefix=$NETCDF --disable-shared --enable-largefile CPPFLAGS="$CPPFLAGS" LDFLAGS="$LDFLAGS" LIBS="$LIBS"

# If the ./configure command still complains that it cannot find NetCDF-C, try forcing the location of nc-config:
$ ./configure --prefix=$NETCDF --disable-shared --enable-largefile CPPFLAGS="$CPPFLAGS" LDFLAGS="$LDFLAGS" LIBS="$LIBS" \
    --with-netcdf=$NETCDF/bin/nc-config

$ make -j$(nproc)
$ make install


$ ls $NETCDF/include/netcdf.inc



###########################################################################################
## alternative that might work
###########################################################################################

# netcdf-fortran

cd $DIR/netcdf-fortran-4.6.0
rm -rf build
mkdir build && cd build


cmake .. \
  -DCMAKE_INSTALL_PREFIX=$NETCDF \
  -DCMAKE_C_COMPILER=gcc \
  -DCMAKE_Fortran_COMPILER=gfortran \
  -DNetCDF_DIR=$NETCDF/lib64/cmake/netCDF \
  -DBUILD_SHARED_LIBS=ON \
  -DENABLE_LARGE_FILE=ON


make -j8
make install


ls $NETCDF/lib64/libnetcdff.so
nf-config --has-nc4   # deve responder "yes"
nf-config --flibs     # deve listar "-L.../lib64 -lnetcdff -lnetcdf …"





###########################################################################################
## Alternative to GSI
###########################################################################################

$ cd /home/augusto.pereira/BUILD_WRF/LIBRARIES/netcdf-c-4.9.2
$ make clean

# Garanta PIC e shared only
$ export CFLAGS="-O2 -fPIC"
$ export CPPFLAGS="-I$PWD/include"
$ export LDFLAGS="-L$PWD/lib"
$ ./configure \
  --prefix=$PWD \
  --enable-shared --disable-static \
  CPPFLAGS="$CPPFLAGS" LDFLAGS="$LDFLAGS"
$ make -j6
$ make install







