#!/bin/bash
#SBATCH --job-name=sampling_kos
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --mem=10G
#SBATCH --time=024:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=jason_vailionis@uri.edu

date

module load miniconda
conda activate Py-3.9_psamm

outdir="./b971180d"
mkdir $outdir
cd $outdir

declare -A models
models[YM_open]="../../sbmls/b971180d_YM_open_OEadhf.sbml"
models[GAPN_YM_open]="../../sbmls/b971180d_YM_GAPN_open_OEadhf.sbml"
models[GAPN_CODH_YM_open]="../../b971180d_YM_GAPN_CODH_open_OEadhf.sbml"
models[YM_closed]="../../sbmls/b971180d_YM_closed_OEadhf.sbml"
models[GAPN_YM_closed]="../../sbmls/b971180d_YM_GAPN_closed_OEadhf.sbml"
models[GAPN_CODH_YM_closed]="../../sbmls/b971180d_YM_GAPN_CODH_closed_OEadhf.sbml"

declare -A deletions
deletions[ACS]="acs9,R00229,acs3,ics,icsG,acs9G,R00229_DASH_G,acs3G"
deletions[AOR]="R08571_H,AOR_Isovaleraldehyde,AOR_acetaldehyde"
deletions[MBH]="mbh"
deletions[NFN1]="nfn1"
deletions[GAPOR]="R07159"

additional_deletions="R01061,R01063"
echo Start time: "$(date)"

combinations=("" "ACS" "AOR" "MBH" "NFN1" "GAPOR" "ACS AOR" "ACS AOR MBH" "ACS AOR NFN1" "NFN1 MBH" "GAPOR MBH" "ACS AOR GAPOR" "GAPOR NFN1" "ACS AOR GAPOR MBH" "ACS AOR GAPOR MBH NFN1")

for model in "${!models[@]}"; do
	for combination in "${combinations[@]}"; do
		deletion_string=""
		for reaction in $combination; do
			deletion_string="$deletion_string","${deletions[$reaction]}"
		done
		deletion_string="${deletion_string:1}"
		echo EVALUATING: "$model" deleting "${combination//[ ]/_}"';'"$deletion_string"
		ls "${models[$model]}"
		python ../sampling.py ${models[$model]} 2500 --runs 10 --threads 10 --delete "$deletion_string","$additional_deletions" --output "$model"_d"${combination//[ ]/_}".csv
	done	
done

cd 
n=$(($(wc -l < YM_open_d.csv) + 1))
echo -e "Source\tTP_ace\tTP_ETOH\tBiomass\tMalABC" > combined.tsv; for x in $(ls *.csv);do paste <(yes $x | head -n $n ) <(csvtk cut -f TP_ace,TP_ETOH,Biomass_Pfu,MalABC $x | tr , '\t') | tail -n +2 >> combined.tsv; done

echo End time: "$(date)"
