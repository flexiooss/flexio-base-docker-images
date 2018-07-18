dependencies <- as.character(unlist(scan('/tmp/requirements.txt', what=list(libraries=character()), quiet = TRUE)))
repos <- c(
	'https://pbil.univ-lyon1.fr/CRAN/',
	'https://mirror.ibcp.fr/pub/CRAN/',
	'https://cran.biotools.fr/',
	'https://ftp.igh.cnrs.fr/pub/CRAN/',
	'https://cran.univ-paris1.fr/'

)

for (i in 1:length(dependencies)){
  if(grepl('#',dependencies[i])){next}
  if(!dependencies[i] %in% installed.packages()){
    print(sprintf("Installing %s", dependencies[i]))
    install.packages(dependencies[i], quiet = TRUE, repos=repos)
  }
}
