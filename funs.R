library(XML)

readAwards =
function(files = list.files( pattern = "xml$"), docs = lapply(files, xmlParse))
{
    titles = sapply(docs, xpathSApply, "//AwardTitle", xmlValue)
    db = data.frame(title = titles, start = as.Date(start, "%m/%d/%Y"), end = as.Date(end, "%m/%d/%Y"), stringsAsFactors = FALSE)
    db$amount = as.integer(sapply(docs, xpathSApply, "//AwardAmount", xmlValue))
    db$directorate = sapply(docs, xpathSApply, "//Organization/Directorate", xmlValue)

    db$abstract = sapply(docs, xpathSApply, "//AbstractNarration", xmlValue)
    db$institution = sapply(docs, xpathSApply, "//Institution/Name", xmlValue)
    db$state = sapply(docs, function(d) paste(xpathSApply(d, "//Institution/StateCode", xmlValue), collapse = ";"))

    invisible(db)
}
