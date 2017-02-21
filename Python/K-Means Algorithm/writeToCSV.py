# -*- coding: utf-8 -*-
"""
Created on Sun Jan 29 13:34:59 2017

@author: noelaugustin
"""
import random
import math
import csv
with open('noel.csv', 'w') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=',')
    for i in range(1000):
        theta=random.uniform(0,2*math.pi)
        rad=random.uniform(0,3)
        spamwriter.writerow([2+rad*math.cos(theta)] + [3+rad*math.sin(theta)])
        
        
    for i in range(1000):
        theta=random.uniform(0,2*math.pi)
        rad=random.uniform(0,3)
        spamwriter.writerow([10+rad*math.cos(theta)] + [10+rad*math.sin(theta)])
    for i in range(1000):
        theta=random.uniform(0,2*math.pi)
        rad=random.uniform(0,3)
        spamwriter.writerow([5+rad*math.cos(theta)] + [15+rad*math.sin(theta)])
    for i in range(1000):
        theta=random.uniform(0,2*math.pi)
        rad=random.uniform(0,3)
        spamwriter.writerow([15+rad*math.cos(theta)] + [5+rad*math.sin(theta)])
    
