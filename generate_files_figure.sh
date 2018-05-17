#!/bin/bash

results=../results/figure
mkdir -p $results
data=../data
genome=../data/tair10.fas
regulated_list=$results/regulated_list
non_regulated_list=$results/non_regulated_list
gff=$data/TAIR10_GFF3_genes.gff



up_1=up_golden_list_more_than_1_arr.txt
up_2=up_golden_list.txt
up_3=up_golden_list_more_than_3_arr.txt

down_1=down_golden_list_more_than_1_arr.txt
down_2=down_golden_list.txt
down_3=down_golden_list_more_than_3_arr.txt


grep . $data/$up_1 | tr -dc '[a-zA-Z0-9]\n' | xargs -I {} grep {} $data/TAIR10_GFF3_genes.gff | grep gene | sed 's/Chr/chr/' | awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' > $results/up_1.bed &
grep . $data/$up_2 | tr -dc '[a-zA-Z0-9]\n' | xargs -I {} grep {} $data/TAIR10_GFF3_genes.gff | grep gene | sed 's/Chr/chr/' | awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' > $results/up_2.bed &
grep . $data/$up_3 | tr -dc '[a-zA-Z0-9]\n' | xargs -I {} grep {} $data/TAIR10_GFF3_genes.gff | grep gene | sed 's/Chr/chr/' | awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' > $results/up_3.bed &


grep . $data/$down_1 | tr -dc '[a-zA-Z0-9]\n' | xargs -I {} grep {} $data/TAIR10_GFF3_genes.gff | grep gene | sed 's/Chr/chr/' | awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' > $results/down_1.bed &
grep . $data/$down_2 | tr -dc '[a-zA-Z0-9]\n' | xargs -I {} grep {} $data/TAIR10_GFF3_genes.gff | grep gene | sed 's/Chr/chr/' | awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' > $results/down_2.bed &
grep . $data/$down_3 | tr -dc '[a-zA-Z0-9]\n' | xargs -I {} grep {} $data/TAIR10_GFF3_genes.gff | grep gene | sed 's/Chr/chr/' | awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' > $results/down_3.bed &

wait

cat $data/$up_1 $data/$up_2 $data/$up_3 $data/$down_1 $data/$down_2 $data/$down_3 |  tr -dc '[a-zA-Z0-9]\n' | sort -u > $results/regulated_list
cat $data/$up_1 $data/$up_2 $data/$up_3 |  tr -dc '[a-zA-Z0-9]\n' | sort -u > $results/up_regulated_list

grep . $results/regulated_list | xargs -I {} grep {} $gff | sed 's/Chr/chr/' | awk -v OFS="\t" ' $3=="gene" {print $0}'|  awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' | awk -v OFS="\t" '($2>0 && $1!="chrM" && $1!="chrC") {print $1,$2,$3}' | sort -u  > $results/regulated_promoters.bed
grep . $results/up_regulated_list | xargs -I {} grep {} $gff | sed 's/Chr/chr/' | awk -v OFS="\t" ' $3=="gene" {print $0}'|  awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' | awk -v OFS="\t" '($2>0 && $1!="chrM" && $1!="chrC") {print $1,$2,$3}' | sort -u  > $results/up_regulated_promoters.bed


python retrieve_non_regulated.py -o $results/non_regulated_list -g $gff -r $results/regulated_list
python retrieve_non_regulated.py -o $results/non_up_regulated_list -g $gff -r $results/up_regulated_list

sed 's/Chr/chr/' $non_regulated_list  | awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' | awk -v OFS="\t" '($2>0 && $1!="chrM" && $1!="chrC") {print $1,$2,$3}' | sort -u  > $results/non_regulated_promoters.bed 
sed 's/Chr/chr/' $results/non_up_regulated_list  | awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' | awk -v OFS="\t" '($2>0 && $1!="chrM" && $1!="chrC") {print $1,$2,$3}' | sort -u  > $results/non_up_regulated_promoters.bed 

sed 's/Chr/chr/' $gff | awk -v OFS="\t" ' $3=="gene" {print $0}'  | awk -v OFS="\t" '$7=="+" {print $1,$4-1500,$4,$7} $7=="-" {print $1,$5,$5+1500,$7}' | awk -v OFS="\t" '($2>0 && $1!="chrM" && $1!="chrC") {print $1,$2,$3}' | sort -u > $results/all_promoters_list.bed
