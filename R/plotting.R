tabledata=read.csv("scope_1.csv")
attach(tabledata)
tim<- as.vector(tabledata[,1])
volt<-as.vector(tabledata[,8])
#plot(tim,volt,xlab="Time (seconds)", ylab="Voltage",typ='l')

# FOR PLOTTING THE VERTICAL DISPLACEMENTS OF RANDOM WAVE
ft=fft(volt)

siz=Mod(ft)


t1=c(1:length(tim))
t1=t1*40/length(tim)
t=t1[1:length(tim)/2]
amp=siz[1:length(tim)/2]
amp[1]=0
amp[2]=0
plot(tim,volt,xlab="Time (sec)",ylab="Height(m)",typ='l')
plot(t,amp,xlab="Frequency",ylab="Height",typ='l')


y=1/t[match(c(max(amp)),amp)]
