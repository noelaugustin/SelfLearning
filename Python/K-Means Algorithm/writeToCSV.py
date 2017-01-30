# -*- coding: utf-8 -*-
"""
Created on Sun Jan 29 13:34:59 2017

@author: noelaugustin
"""
import random
import csv
with open('noel.csv', 'w') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=',')
    for i in range(100):
        spamwriter.writerow([random.uniform(0,10)] + [random.uniform(0,10)])
        
        
    for i in range(100):
        spamwriter.writerow([random.uniform(30,40)] + [random.uniform(30,40)])
    for i in range(100):
        spamwriter.writerow([random.uniform(0,10)] + [random.uniform(30,40)])
    for i in range(100):
        spamwriter.writerow([random.uniform(30,40)] + [random.uniform(0,10)])
    
