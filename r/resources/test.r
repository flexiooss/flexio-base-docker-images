dependencies <- as.character(unlist(scan('/tmp/requirements.txt', what=list(libraries=character()), quiet = TRUE)))

for (dep in dependencies){
    if(grepl('#', dep)){print(sprintf("Skipping %s", dep));next}
    library(dep, character.only=TRUE)
}

library(flexioR)
library(magrittr)

if ("keras" %in% dependencies) {
	model <- keras_model_sequential()
	model %>%
  	layer_dense(units = 256, activation = 'relu', input_shape = c(784)) %>%
  	layer_dropout(rate = 0.4) %>%
  	layer_dense(units = 128, activation = 'relu') %>%
  	layer_dropout(rate = 0.3) %>%
  	layer_dense(units = 10, activation = 'softmax')
}
