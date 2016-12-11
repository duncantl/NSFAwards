unz =
function(y, force = FALSE)
{
    y = as.character(y)
    if(!file.exists(y))
       dir.create(y)

    cur = getwd()
    setwd(y)
    on.exit(setwd(cur))

    if(force || length(list.files(".")) < 1) {
          cat("unzipping", y, "\n")
          system(sprintf("unzip ../%s.zip", y))
    }
}    

y = c(1959:2014, "Historical")
y = gsub("\\.zip", "", list.files(pattern = "zip$"))
sapply(y, unz)

library(Rcompression)
checkYear =
function(year)
{
  year = as.character(year)
  z = sprintf("%s.zip", year)
  a = zipArchive(z)
  els = names(a)
  i = file.exists(sprintf("%s/%s", year, els))
  !all(i)
}
