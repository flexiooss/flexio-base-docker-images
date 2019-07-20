dependencies <- as.character(unlist(scan('/tmp/requirements.txt', what=list(libraries=character()), quiet = TRUE)))

for (i in 1:length(dependencies)) { library(dependencies[i], character.only=TRUE) }

library(flexioR)
