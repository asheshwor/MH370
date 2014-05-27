#reading MH370 data
mh370.raw <- read.delim("U:/github/MH370/MH370.txt", stringsAsFactors=FALSE)
head(mh370.raw)
names(mh370.raw)
str(mh370.raw)
mh370.raw$posixct <- as.POSIXct(mh370.raw$tm, format = "%Y-%m-%d %H:%M:%S")
mh370.raw$ocean_region <- as.factor(mh370.raw$ocean_region)
mh370.raw$ges_id_octal <- as.factor(mh370.raw$ges_id_octal)
mh370.raw$channel_unit_id <- as.factor(mh370.raw$channel_unit_id)
mh370.raw$channel_type <- as.factor(mh370.raw$channel_type)
str(mh370.raw)
##plot
require(ggplot2)
p.my <- ggplot() + geom_point(data=mh370.raw,
                               aes(posixct, BTO/1000000, col=BFO, shape=channel_type),
                               stat="identity", alpha=1, size=5) +
  ggtitle(paste("MH370 log data")) + xlab("time in UTC") + ylab("Burst Timing Offset (seconds)") +
  theme_bw()
p.my
