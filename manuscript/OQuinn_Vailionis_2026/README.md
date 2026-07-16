# OQuinn 2026 & Vailionis 2026 - *P. furiosus* Metabolomics & BDO Analysis

Code and data for companion papers O'Quinn et al. 2026 & Vailionis et al. 2026, analyzing metabolome changes and energy balance in *P. furiosus* during BDO production.

## Notebooks

### `metabolomics_DEA.ipynb`
Differential expression analysis of targeted and untargeted metabolomics data. This must be run first as it generates the result tables consumed by the figure notebook.

**Outputs** (written to `data/metabolomics/`):
- `2026-04-05_Pfu_targeted_limma_results.csv`
- `2026-04-05_Pfu_untargeted_limma_results.csv`

### `Fig_8-9.ipynb`
Generates manuscript Figures 8 and 9. Reads limma results from the DEA notebook, maps detected metabolites to model metabolites, and produces energy balance and metabolome change visualizations.

**Outputs** (written to `output/`):
- `Fig_8_energy_balance.png`
- `Fig_9_metabolome_changes.png`
- `MRA_Fig_1_volcano.png`

## Figure 7 — Interactive Network Visualization

Figure 7 is an interactive network visualization with its own repository and build environment:

**Repository:** [https://github.com/jvjvjvjv/pfu-bdo-networkvis](https://github.com/jvjvjvjv/pfu-bdo-networkvis)

A Docker image is provided to run the live figure locally. The GitHub Pages site at that repository serves a static version matching the manuscript figure.

## Data

Large metabolomics files are tracked with Git LFS. Ensure you have LFS installed before cloning:

```bash
git lfs install
git clone https://github.com/zhanglab/GEM-iPfu.git
```
