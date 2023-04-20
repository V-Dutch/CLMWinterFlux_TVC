# TVCSnowCLM
Data & code needed to construct figures for *Simulating soil respiration under seasonal snow cover at an Arctic tundra site*, Dutch et al. (2023). [Submission imminent - DOI Pending]

# Abstract  

# Read Me
This gitrepo should contain 3 subfolders:
- CLMForcingData
- CLMOutputData
- TVCObs

And 3 Files:
- ReadMe.md (This File)
- Paper2Figures.m
- shadedplot.m*

In order to create figures; 
1. Run Paper2Figures.m

In order to re-run the model; 
1. cd CLMForcingData, and run .m* to produce all nessacery forcing files.
2. Upload newly generated forcing data
3. Run PTCLM with modifications as described in paper.

v1.0 - V. R. Dutch, Jan 2023

*Dave Van Tol (2020). Shaded area plot (https://www.mathworks.com/matlabcentral/fileexchange/18738-shaded-area-plot), MATLAB Central File Exchange. Retrieved October 2020.