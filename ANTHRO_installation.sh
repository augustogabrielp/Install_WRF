cd /home/augusto.pereira/BUILD_WRF/Processors/ANTHRO/ANTHRO/src

export NETCDF_DIR=/home/augusto.pereira/BUILD_WRF/LIBRARIES/netcdf
export CPATH=$NETCDF_DIR/include:$CPATH
export LIBRARY_PATH=$NETCDF_DIR/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$NETCDF_DIR/lib:$LD_LIBRARY_PATH

export FC=gfortran  


##################################################################################
##################################################################################
##################################################################################
#
# edit Makefile or change all Makefile
#
##################################################################################
##################################################################################
##################################################################################

vi Makefile


##################################################################################
##################################################################################
##################################################################################

# .SUFFIXES: .o .f90
# 
# HDF5_DIR = /home/augusto.pereira/BUILD_WRF/LIBRARIES/hdf5
# F90             = $(FC)
# LIBS   = -L$(NETCDF_DIR)/lib $(AR_FILES) -lnetcdff -lnetcdf \
#          -L$(HDF5_DIR)/lib -lhdf5 -lhdf5_hl -lz # LIBS   = -L$(NETCDF_DIR)/lib $(AR_LIBS) # LIBS   = -L$(NETCDF_DIR)/lib $(AR_LIBS)
# INCLUDE_MODULES = -I$(NETCDF_DIR)/include
# 
# ifeq ($(FC),lf95)
#   FFLAGS = --g
# else
#   FFLAGS = -g
# endif
# 
# ifeq ($(FC),pgf90)
#   FFLAGS += -Mnosave -Ktrap=fp
# endif
# 
# ifeq ($(FC),gfortran)
#   FFLAGS += -ffree-line-length-none
# endif
# 
# ifeq ($(FC),lf95)
#   FFLAGS += --nap --chk --pca --nsav --trace --trap --wide
# endif
# 
# ifeq ($(FC),ifort)
#   FFLAGS += -fpe0 -ftrapuv
# endif
# 
# EXEC = anthro_emis
# 
# OBJS = misc_definitions_module.o constants_module.o mo_calendar.o anthro_types.o mapper_types.o area_mapper.o anthro_utils.o data_file_utils.o anthro_emis.o
# 
# ##dependencies
# #$(OBJECTS) : makefile
# 
# ${EXEC} :       ${OBJS}
#                 ${F90} -o $@ ${OBJS} ${LIBS}
# 
# .f90.o:
#                 ${F90} ${FFLAGS} -c ${INCLUDE_MODULES} $<
# 
# cleanup:
#                 rm -f ${OBJS} *.mod
# 
# clean:
#                 rm -f core ${EXEC} ${OBJS} *.mod

##################################################################################
##################################################################################
##################################################################################

chmod +x make_anthro
ls -l make_anthro
# -rwxr-xr-x 1 augusto.pereira augusto.pereira  XXXX Mar 13 12:00 make_anthro

./make_anthro


# ++++++++++++++++++++
# anthro_emis build Ok
# ++++++++++++++++++++


