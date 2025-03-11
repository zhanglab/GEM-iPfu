# GEM-iPfu, Genome-scale metabolic model of *Pyrococcus furiosus*
[![DOI](https://zenodo.org/badge/624461310.svg)](https://zenodo.org/badge/latestdoi/624461310)

Files in this repository represent the genome-scale model of *Pyrococcus furiosus*. The following are publications associated with the model with simulation code saved in this repository:
* Vailionis, Jason L., Weishu Zhao, Ke Zhang, Dmitry A. Rodionov, Gina L. Lipscomb, Tania N. N. Tanwee, Hailey C. O’Quinn, et al. 2023. “Optimizing Strategies for Bio-Based Ethanol Production Using Genome-Scale Metabolic Modeling of the Hyperthermophilic Archaeon, Pyrococcus Furiosus.” Applied and Environmental Microbiology 89 (6): e0056323.
* O’Quinn, Hailey, Jason Vailionis, Tania Tanwee, Katherine Holandez-Lopez, Ryan Bing, Farris Poole, Ying Zhang, Robert Kelly, and Michael Adams. 2025. “Engineering the Hyperthermophilic Archaeon Pyrococcus Furiosus for 1-Propanol Production.” Applied and Environmental Microbiology.

This work is licensed under a [Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.](https://creativecommons.org/licenses/by-nc-nd/4.0/)

### List of files
#### Model files
* model.yaml
  > Basic model definition YAML file, configured for the WT model by default
* model_product.yaml
  > alternative model definition YAML file, configured to use the EX_YM_adhf.yaml media file and COM1 model by default, which requires additional files to be loaded
* sbmls/
  > snapshots of specific model configurations saved in sbml format

#### Model definitions
* WT_model_def.tsv
  > list of reactions that make up the WT (DSM 3638) model
* COM1_model_def.tsv
  > list of reactions that make up the COM1 model
* COM1-xyl_model_def.tsv
  > list of reactions that make up the COM1 model with engineered xylose consumption pathway from Thermotoga maritima
* propanol_model_def.tsv
  > list of reactions that make up the COM1 model with engineered propanol production pathway
* media_def.tsv
  > includes additional components that are required to use the EX_YM_adhf.tsv media

#### Model components
* compounds.yaml
  > definition of metabolites
* reactions.yaml
  > definition of reactions based on genome annotations of the *P. furiosus* DSM 3638
* engineered_reactions.yaml
  > definition of reactions related to the simulation of engineering designs in *P. furiosus*
* limits.yaml
  > defines bounds on specific reactions that can differ from their enzymatic directionality
* sink.yaml
  > definition of compound sink reactions
* transport.yaml
  > definition of transport reactions
* EX_byproduct.yaml
  > exchange file which allows potential byproducts to be released
* spontaneous.yaml
  > definition of spontaneous/non-enzymatic reactions
* biomass.yaml
  > definition of biomass reactions
* gapfill.yaml
  > gap-filling reactions
* media_compounds.yaml
  > additional compounds that are required to use the EX_YM_adhf.tsv media
* media_conversion_rxns.yaml
  > additional reactions that are required to use the EX_YM_adhf.tsv media

#### Media definitions
* EX_Kengen_94.tsv
  > Media matching experiments from Kengen and Stams 1994 (Growth and energy conservation in batch cultures of Pyrococcus furiosus. FEMS Microbiol Lett 117:305–309.)
* Adams_media/*
  > Media matching various carbon conditions from Adams et al. 2001. (Key Role for Sulfur in Peptide Metabolism and in Regulation of Three Hydrogenases in the Hyperthermophilic Archaeon Pyrococcus furiosus. J Bacteriol 183:716–724.)
  
  > Inlcudes three files:
    * EX_Adams_Peptide-S0.tsv - Peptide medium with sulfur
    * EX_Adams_Malt-Peptide-S0.tsv - Peptide + maltose medium with sulfur
    * EX_Adams_Malt-S0.tsv - Maltose medium with sulfur
* EX_YM_adhf.tsv
  > minimal maltose medium, can be configured to use different concentrations of yeast extract

#### Manuscript simulations
* manuscripts/Vailionis_2023
  > Jupyter notebooks with code to perform all modeling analysis and generate figures in Vailionis et al. 2023
* manuscripts/OQuinn_2025
  > Jupyter notebooks with code to perform all modeling analysis and generate figures in O'Quinn et al. 2025
