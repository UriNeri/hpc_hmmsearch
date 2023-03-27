#!/bin/bash
cd ~
mkdir scripts
cd scripts
wget http://eddylab.org/software/hmmer/hmmer-3.3.2.tar.gz
extract hmmer-3.3.2.tar.gz
cd hmmer-3.3.2
cd src
wget https://raw.githubusercontent.com/Larofeticus/hpc_hmmsearch/master/hpc_hmmsearch.c
cd ..
#autoconf
./configure
make V=1 | grep "hmmsearch"
# copy paste, add the hpc_ prefix etc etc. See the actual repo and ths fork for info e.g. openmp and so on.
# Should look something like:
  cd src
  gcc -O3 -pthread     -DHAVE_CONFIG_H  -I../easel -I../libdivsufsort -I../easel -I. -I. -o hpc_hmmsearch.o -c hpc_hmmsearch.c -openmp
  gcc -O3 -pthread     -DHAVE_CONFIG_H  -L../easel -L./impl_sse -L../libdivsufsort -L. -o hpc_hmmsearch hpc_hmmsearch.o -lhmmer -leasel -ldivsufsort     -lm -openmp
