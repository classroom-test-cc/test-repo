#!/bin/bash

#potential script for submitting a CESM job

cd /oscar/data/deeps/private/chorvat/agglover #replace with username
cp -r /oscar/data/deeps/shared/opt/cesm/cesm1_2_2 .

module load hpcx-mpi/4.1.5rc2s-yflad4v
module load netcdf/4.9.2-ar77jpt
module load perl/5.36.0-bt34quz

cd /oscar/data/deeps/private/chorvat/agglover/cesm1_2_2/scripts
./create_newcase -case E.CESM122.oscar.test.001 -res f19_g16 -mach oscar -compset E_TEST_2000
cd ./E.CESM122.oscar.test.001
./xmlchange CAM_CONFIG_OPTS="-phys cam5"
./xmlchange DOUT_S=FALSE

#need to parse env_mach_pes.xml and change all instances of 64 to 48

./cesm_setup
./xmlchange SSTICE_DATA_FILENAME="/oscar/data/deeps/shared/cesm/input/sst_HadOIBl_bc_1x1_clim_c101029.nc"
./E.CESM122.oscar.test.000.build
./E.CESM122.oscar.test.000.submit
