# -*- coding: utf-8 -*-
"""
Created on Mon Jun 12 14:16:33 2023

@author: lanot
"""
import numpy as np
import sys

# number of the sample to calculate variance of
samplenumber = sys.argv[1]

# number of lineages to calculate variances of
lins = int(sys.argv[2])

# number of files to calculate the variance over
num_files = int(sys.argv[3])

# file without numbering attached. In fileformat as found in for example /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/abundances/sample_03
filename = sys.argv[4]

weights = np.zeros([lins,num_files])

for i in range(1,num_files+1):
    
    f = open(f'{filename}{i}.yaml', 'r')
    buffer = f.read()
    f.close()
    
    for j in range(0,int(len(buffer.split('\n'))-1)):  
        weights[j,i-1]=buffer.split()[1+j*2]

print('sample ' + samplenumber + ': ' + np.array2string(weights))
