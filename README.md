# TVCSnowCLM
Data & code needed to construct figures for *Simulating soil respiration under seasonal snow cover at an Arctic tundra site*, Dutch et al. (2023). [DOI Pending]

# Abstract
Estimates of winter (snow-covered non-growing season) CO2 fluxes across the Arctic region vary by a factor of three and a half, with considerable variation between measured and simulated fluxes. Measurements of snow properties, soil temperatures and net ecosystem exchange (NEE) at Trail Valley Creek, NWT, Canada, allowed evaluation of simulated winter NEE in a tundra environment with the Community Land Model (CLM5.0). Default CLM5.0 parameterisations did not adequately simulate winter NEE in this tundra environment, with near-zero NEE (< 0.01 g C m-2 d-1) simulated between November and mid-May. In contrast, measured NEE was broadly positive (indicating net CO2 release) from snow cover onset until late April. Changes to the parameterisation of snow thermal conductivity, required to correct for a cold soil temperature bias, reduced the duration for which no NEE was simulated. Parameter sensitivity analysis revealed the critical role of the minimum soil moisture threshold on decomposition (Ψmin) in regulating winter soil respiration. The default value of this parameter (Ψmin) was too high, preventing simulation of soil respiration for the vast majority of the snow-covered season. In addition, the default rate of change of soil respiration with temperature (Q10) was too low, further contributing to poor model performance during winter. As Ψmin and Q10 had opposing effects on the magnitude of simulated winter soil respiration, larger negative values of Ψmin and larger positive values of Q10 are required to simulate wintertime NEE more adequately.

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
