### prediction phase

*make picture which nicely illustrates:*

this happens for each classification
- load the newest and best predictor for the classification
  - this will also load the used modules to preprocess a job
- a vector for the job will be created with the saved preprocessing modules
- this vector will be dropped into the saved SVM
- the SVM will return a prediction if the classification was correct
- and a probability which describes how certain the SVM was