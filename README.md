# GEM-iPfu, Genome-scale metabolic model of *Pyrococcus furiosus*

Files in this repository represent the genome-scale model of *Pyrococcus furiosus*. The model is first reported in the following publication:
* Vailionis, J. Zhao, W., Zhang, K., Rodionov, D., Lipscomb, G. L., Tanwee, T. N. N., O&#39;Quinn,
H. C., Kelly R. M., Adams, M. W. W., Zhang, Y. 2023. Optimizing strategies for bio-
based ethanol production using genome-scale metabolic model of the hyperthermophilic
archaeon, Pyrococcus furiosus. Appl. Environ. Microbiol.


### List of files
#### Model files
* model.yaml
  > Basic model definition YAML file, configured for the WT model by default
* model_product.yaml
  > alternative model definition YAML file, configured to use the EX_YM_adhf.yaml media file and COM1 model by default, which requires additional files to be loaded

#### Model definitions
* WT_model_def.tsv
  > list of reactions that make up the WT (DSM 3638) model
* COM1_model_def.tsv
  > list of reactions that make up the COM1 model
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
* Adams_mediae/*
  > Media matching various carbon conditions from Adams et al. 2001. (Key Role for Sulfur in Peptide Metabolism and in Regulation of Three Hydrogenases in the Hyperthermophilic Archaeon Pyrococcus furiosus. J Bacteriol 183:716–724.)
  
  > Inlcudes three files:
    * EX_Adams_Peptide-S0.tsv - Peptide medium with sulfur
    * EX_Adams_Malt-Peptide-S0.tsv - Peptide + maltose medium with sulfur
    * EX_Adams_Malt-S0.tsv - Maltose medium with sulfur
* EX_YM_adhf.tsv
  > minimal maltose medium, can be configured to use different concentrations of yeast extract
