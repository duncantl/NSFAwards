dirs = c(list.files(pattern = "^[12][0-9]{3}$"), "Historical")
dfs = lapply(dirs, readAwards)
