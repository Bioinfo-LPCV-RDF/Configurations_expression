#!/bin/bash

results=../results/figure
mkdir -p $results
data=../data
genome=../data/tair10.fas
non_regulated_promoters=$results/non_regulated_promoters.bed
gff=$data/TAIR10_GFF3_genes.gff
MP=../data/MP_peaks.narrowPeak
ARF2=../data/ARF2_peaks.narrowPeak


######## regulated promoters ########

bedtools getfasta -bed $results/non_regulated_promoters.bed -fi $genome -fo $results/non_regulated_promoters.fas
bedtools getfasta -bed $results/regulated_promoters.bed -fi $genome -fo $results/regulated_promoters.fas
bedtools getfasta -bed $results/non_up_regulated_promoters.bed -fi $genome -fo $results/non_up_regulated_promoters.fas
bedtools getfasta -bed $results/up_regulated_promoters.bed -fi $genome -fo $results/up_regulated_promoters.fas
bedtools getfasta -bed $results/down_regulated_promoters.bed -fi $genome -fo $results/down_regulated_promoters.fas

up_1=$results/up_1.bed
up_2=$results/up_2.bed
up_3=$results/up_3.bed

down_1=$results/down_1.bed
down_2=$results/down_2.bed
down_3=$results/down_3.bed


bedtools intersect -wa -a $MP -b $up_1  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/MP_up_1.bed
bedtools intersect -wa -a $MP -b $up_2  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/MP_up_2.bed
bedtools intersect -wa -a $MP -b $up_3  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/MP_up_3.bed

bedtools intersect -wa -a $ARF2 -b $up_1  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/ARF2_up_1.bed
bedtools intersect -wa -a $ARF2 -b $up_2  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/ARF2_up_2.bed
bedtools intersect -wa -a $ARF2 -b $up_3  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/ARF2_up_3.bed

bedtools  getfasta -bed $results/MP_up_1.bed -fi $genome -fo $results/MP_up_1.fas
bedtools  getfasta -bed $results/MP_up_2.bed -fi $genome -fo $results/MP_up_2.fas
bedtools  getfasta -bed $results/MP_up_3.bed -fi $genome -fo $results/MP_up_3.fas

bedtools  getfasta -bed $results/ARF2_up_1.bed -fi $genome -fo $results/ARF2_up_1.fas
bedtools  getfasta -bed $results/ARF2_up_2.bed -fi $genome -fo $results/ARF2_up_2.fas
bedtools  getfasta -bed $results/ARF2_up_3.bed -fi $genome -fo $results/ARF2_up_3.fas

bedtools intersect -wa -a $MP -b $down_1  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/MP_down_1.bed
bedtools intersect -wa -a $MP -b $down_2  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/MP_down_2.bed
bedtools intersect -wa -a $MP -b $down_3  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/MP_down_3.bed

bedtools intersect -wa -a $ARF2 -b $down_1  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/ARF2_down_1.bed
bedtools intersect -wa -a $ARF2 -b $down_2  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/ARF2_down_2.bed
bedtools intersect -wa -a $ARF2 -b $down_3  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/ARF2_down_3.bed

bedtools  getfasta -bed $results/MP_down_1.bed -fi $genome -fo $results/MP_down_1.fas
bedtools  getfasta -bed $results/MP_down_2.bed -fi $genome -fo $results/MP_down_2.fas
bedtools  getfasta -bed $results/MP_down_3.bed -fi $genome -fo $results/MP_down_3.fas

bedtools  getfasta -bed $results/ARF2_down_1.bed -fi $genome -fo $results/ARF2_down_1.fas
bedtools  getfasta -bed $results/ARF2_down_2.bed -fi $genome -fo $results/ARF2_down_2.fas
bedtools  getfasta -bed $results/ARF2_down_3.bed -fi $genome -fo $results/ARF2_down_3.fas

######## non regulated promoters ########

bedtools intersect -wa -a $MP -b $non_regulated_promoters  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/MP_not_regulated.bed
bedtools intersect -wa -a $ARF2 -b $non_regulated_promoters  | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/ARF2_not_regulated.bed

bedtools  getfasta -bed $results/MP_not_regulated.bed -fi $genome -fo $results/MP_not_regulated.fas
bedtools  getfasta -bed $results/ARF2_not_regulated.bed -fi $genome -fo $results/ARF2_not_regulated.fas


###### bound and unbound promoters  ######

bedtools intersect -wa -a $results/all_promoters_list.bed -b $MP   | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/promoters_intersect_MP.bed
bedtools intersect -v  -a $results/all_promoters_list.bed -b $MP   | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/promoters_wo_MP.bed

bedtools intersect -wa -a $results/all_promoters_list.bed -b $ARF2   | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/promoters_intersect_ARF2.bed
bedtools intersect -v  -a $results/all_promoters_list.bed -b $ARF2   | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/promoters_wo_ARF2.bed

ARF2_MP=$(mktemp)
cat $MP $ARF2 > $ARF2_MP

bedtools intersect -wa -a $results/all_promoters_list.bed -b $ARF2_MP   | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/promoters_intersect_ARF2_MP.bed
bedtools intersect -v  -a $results/all_promoters_list.bed -b $ARF2_MP   | awk -v OFS="\t" '{print $1,$2,$3}' | sort -u > $results/promoters_wo_ARF2_MP.bed


bedtools  getfasta -bed $results/promoters_intersect_MP.bed -fi $genome -fo $results/promoters_intersect_MP.fas
bedtools  getfasta -bed $results/promoters_intersect_ARF2.bed -fi $genome -fo $results/promoters_intersect_ARF2.fas
bedtools  getfasta -bed $results/promoters_intersect_ARF2_MP.bed -fi $genome -fo $results/promoters_intersect_ARF2_MP.fas

bedtools  getfasta -bed $results/promoters_wo_MP.bed -fi $genome -fo $results/promoters_wo_MP.fas
bedtools  getfasta -bed $results/promoters_wo_ARF2.bed -fi $genome -fo $results/promoters_wo_ARF2.fas
bedtools  getfasta -bed $results/promoters_wo_ARF2_MP.bed -fi $genome -fo $results/promoters_wo_ARF2_MP.fas


exit 0
