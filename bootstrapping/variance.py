# -*- coding: utf-8 -*-
"""
Created on Mon Jun 12 14:16:33 2023

@author: lanot
"""
import numpy as np
import sys

# number of the sample to calculate variance of
samplenumber = sys.argv[1]

# number of files to calculate the variance over
num_files = int(sys.argv[2])

# file without numbering attached. In fileformat as found in for example /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/abundances/sample_03
filename = sys.argv[3]

weights = np.zeros([41,num_files])
mean = np.zeros([41,1])

for i in range(1,num_files+1):
    
    f = open(f'{filename}{i}.yaml', 'r')
    buffer = f.read()
    f.close()
    
    for j in range(0,int(len(buffer.split('\n'))-1)):  
        weights[j,i-1]=buffer.split()[1+j*2]

#     print(weights[:,i-1])
# print(weights)

for i in range(0,int(len(buffer.split('\n'))-1)):
    mean[i] = np.mean(weights[i,:])

# subtract the row means from the row elements
prevar = weights - mean

# take square of all elements in the matrix
sqvar = np.square(prevar)

# sum the rows
sumvar = sqvar.sum(axis=1)

# calculate the variance of every row
var = sumvar * (1/(num_files))

# take the average variance of the sample
samplevar = np.mean(var) 

print('sample ' + samplenumber + ': ' + np.array2string(samplevar))
