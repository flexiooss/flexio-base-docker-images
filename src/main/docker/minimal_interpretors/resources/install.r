dependencies <- as.character(unlist(scan('/tmp/requirements.txt', what=list(libraries=character()), quiet = TRUE)))
repos <- c(
	'https://pbil.univ-lyon1.fr/CRAN/',
	'https://mirror.ibcp.fr/pub/CRAN/',
	'https://cran.biotools.fr/',
	'https://ftp.igh.cnrs.fr/pub/CRAN/',
	'https://cran.univ-paris1.fr/'

)

for (dep in dependencies){
    if(grepl('#', dep)){print(sprintf("Skipping %s", dep));next}
    if(!dep %in% installed.packages()){
        print(sprintf("Installing %s", dep))
        install.packages(dep, quiet = TRUE, repos=repos)
    } else {
        print(sprintf("Skipping %s", dep))
    }
}
