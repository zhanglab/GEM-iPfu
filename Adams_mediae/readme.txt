There were multiple versions of the EX_Adams_2001 media floating around previously - the EX_Adams_2001.tsv and the EX_Adams_2001_rich.tsv. These media are replicating the growth conditions from the 2001 Adams paper (https://doi.org/10.1128/JB.183.2.716-724.2001). However, this paper had five different growth conditions, including combinations of maltose and peptides (from casein hydrolysate), with and without sulfur. 

The EX_Adams_2001.tsv media accurately matches the maltose condition, which includes an additional 0.5 g/L yeast extract (in the paper this is described as 5 mL of 10% wt/vol yeast extract). In other conditions, 5 g/L yeast extract ("0.5% wt/vol in final solution") was used, and this is what is contained in the EX_Adams_2001_rich.tsv.

However, neither media includes the additional peptide component from the casein hydrolysate. 

I calculated these concentrations using amino acid estimates from enzymatically degraded casein (see https://docs.google.com/spreadsheets/d/1OgydTLHC4R_tk9YTclR-uH4HZ8DdtHBAsEMGihrYnYU/edit?usp=sharing) so that we could properly simulate the peptide conditions.
