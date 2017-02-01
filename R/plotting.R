tabledata=read.csv("scope_9.csv")
attach(tabledata)
tim<- as.vector(tabledata[,1])
volt<-as.vector(tabledata[,5])
plot(tim,volt,xlab="Time (seconds)", ylab="Voltage",typ='l')

# FOR PLOTTING THE VERTICAL DISPLACEMENTS OF RANDOM WAVE