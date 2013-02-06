### training phase

*make picture which nicely illustrates:*

- prepare job data
- create a dictionary
- build a vector of [0,1] for each job
- find the best parameters
  - using brute force
  - using a nelder-mead simplex algorithmus
  - using a DesignOfExperiment heuristic
- use the best parameters to make the final SVM
- save both the preprocessing and the SVM to the DB