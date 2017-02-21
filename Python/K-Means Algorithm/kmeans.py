# -*- coding: utf-8 -*-
"""
Created on Sun Jan 29 11:39:13 2017

@author: noelaugustin
"""

import random
import numpy as np
import matplotlib.pyplot as plt
centroidnumber=4
a=np.arange(1)
b=np.arange(1)
a,b= np.loadtxt('noel.csv',delimiter=',',usecols=(0,1),unpack=True)
cenx=0
ceny=0
cx=[]
cy=[]
#plt.scatter(a,b)

clusterx=[]
clustery=[]
for _ in range(centroidnumber):
    clusterx.append([])
    clustery.append([])

    
def distsq(x1,y1,x2,y2):
    return (x1-x2)**2+(y1-y2)**2
    
def mini(u,v):
    g=[]
    j=0
    minim=float('Inf')
    for i in range(centroidnumber):
        g.append(distsq(u,v,cx[i],cy[i]))
    for i in range(centroidnumber):
        if g[i]<minim:
            minim=g[i]
            j=i
    return j
    
def chooseinitialcentroids():
    
    random1=random.randint(0,len(a))                                               #trying to assign a random point to the first centroid
    cx.append(a[random1])              
    cy.append(b[random1])
    
    
    maxi=0
    for i in range(1,centroidnumber):
        maxi=0.0000
        j=0
        for k in range(len(a)):
            dist=0.0000
            for m in range(i):
                dist=dist+distsq(a[k],b[k],cx[m],cy[m])
            if dist>maxi:
                maxi=dist
                j=k
        cx.append(a[j])
        
        cy.append(b[j])
        
       
def clustering():
    for n in range(len(a)):
        num=mini(a[n],b[n])
        
        clusterx[num].append(a[n])
        clustery[num].append(b[n])
        cx[num]=(sum(clusterx[num])+cx[num])/(1+len(clusterx[num]))
        cy[num]=(sum(clustery[num])+cy[num])/(1+len(clusterx[num]))
        
        
    
    
    
    
            
            
chooseinitialcentroids()
clustering()
print cx,cy
plt.scatter(clusterx[0],clustery[0],color='RED')
plt.scatter(clusterx[1],clustery[1],color='BLUE')
plt.scatter(clusterx[2],clustery[2],color='GREEN')
plt.scatter(clusterx[3],clustery[3],color='BLACK')
