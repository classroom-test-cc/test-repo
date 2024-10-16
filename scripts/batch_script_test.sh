#!/bin/bash
# Example batch script for running mpi jobs on Oscar
#**********************
# SLURM JOB INFORMATION
#**********************
# Walltime requested for job (1 hr)
#SBATCH --time=1:00:00

# Request use of 48 cores and 4GB of memory per core on 4 nodes (192 cores total)
# SBATCH --nodes=4
# SBATCH --ntasks-per-node=48
# SBATCH --cpus-per-task=1
# SBATCH --mem-per-cpu=4G

#SBATCH -n 1

# Define Oscar partition to use
#SBATCH --partition=batch

# Job Name
#SBATCH -J MyMPIJob 

# SLURM output (*.out) and error (*.err) file names
# Use '%x' for Job Name,'%A' for array-job ID, '%j' for job ID and '%a' for task ID`
#SBATCH -e %x-%j.err
#SBATCH -o %x-%j.out

# Notify user if job fails or ends (uncomment and add your email address to use)
#SBATCH --mail-user=ashton_glover@brown.edu
#SBATCH --mail-type=FAIL,END

#********************
# COMMANDS TO EXECUTE
#********************
# load desired modules (change to suit your particular needs)
module load hpcx-mpi/4.1.5rc2s

# activate virtual environment
#source ~/envs/myvirtualenv.venv/bin/activate

# set environment variables (change to suit your needs)
EXAMPLE_VARIABLE="Hello!"

# commands to be executed (change to suit your needs)
echo $EXAMPLE_VARIABLE
# srun --mpi=pmix echo $EXAMPLE_VARIABLE 