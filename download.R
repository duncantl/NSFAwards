library(XML)
u = "https://www.nsf.gov/awardsearch/download.jsp"
library(RCurl)
doc = htmlParse(getURLContent(u))
ll = getHTMLLinks(doc)

dl = grep("download\\?", ll, value = TRUE)
urls = getRelativeURL(dl, u)
fn = sprintf("%s.zip", gsub(".*FileName=([^&]+)&.*", "\\1", dl))
cmd = sprintf("wget '%s' -O %s", urls, fn)

system.time(sapply(cmd, system))
