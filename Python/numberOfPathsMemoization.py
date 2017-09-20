
"""
a is the matrix which is taken in the form of a list of lists
start_x is the x cooordinate and start_y is the y coordinate of the starting point.
path is the memoization list which helps us in the optimization of the code,
by eliminating the need of recursion at each and every point

"""



def paths(a,start_x,start_y,path):

	#case of reaching the endpoint
	if (start_x+1==len(a[0])-1 and start_y==len(a)-1) or start_x==len(a[0])-1 and start_y+1==len(a)-1:
		path[start_y][start_x]=1

	#case when the person crosses the edge
	if start_y==len(a) or start_x==len(a[0]):
		return 0

	#case when the person reaches a block
	if a[start_y][start_x]==1:
		path[start_y][start_x]=0

	#use recursion only if the memoized list doesnt have the value in it
	if path[start_y][start_x]==-1:
		path[start_y][start_x]=paths(a,start_x+1,start_y,path)+paths(a,start_x,start_y+1,path)


	#assign it to the memoization array and then return it
	return path[start_y][start_x]
	
	





# b is the list of lists. A 1 in any of the block means that the block is blocked

b=[
	[0,0,0],
	[0,0,0],
	[0,0,0]
	]

#path is the list of lists which stores the number of paths so as to access it easier
path=[
	[-1,-1,-1],
	[-1,-1,-1],
	[-1,-1,-1]
	]


print(paths(b,0,0,path))
print(path )
