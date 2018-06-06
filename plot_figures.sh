#!/bin/bash

results=../results/figure
mkdir -p $results
genome=../data/tair10.fas

matrix_MP=../data/MP.pfm
matrix_ARF2=../data/ARF2_TGTC.pfm

matrix_wh_MP=$(mktemp)
tail -n +3 $matrix_MP | awk -v OFS="\t" '{print $1".0",$2".0",$3".0",$4".0"}' > $matrix_wh_MP

matrix_wh_ARF2=$(mktemp)
tail -n +3 $matrix_ARF2 | awk -v OFS="\t" '{print $1".0",$2".0",$3".0",$4".0"}' > $matrix_wh_ARF2




############## debug ##############
# mkdir -p ../results/tests
# cd ../lib/get_interdistances_program
# python get_interdistances.py  -pos ../$results/MP_up_1_-8_-9_-10_-11_pos.pkl ../$results/MP_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../../results/tests -n MP_regulated_vs_non_middle_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 
# exit 0

#################  MP  #################

cd ../lib/get_interdistances_program

############### up regulated #############

python get_interdistances.py  -pos ../$results/MP_up_1_-8_-9_-10_-11_pos.pkl ../$results/MP_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n MP_regulated_vs_non_middle_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/MP_up_2_-8_-9_-10_-11_pos.pkl ../$results/MP_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n MP_regulated_vs_non_high_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/MP_up_3_-8_-9_-10_-11_pos.pkl ../$results/MP_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n MP_regulated_vs_non_low_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/ARF2_up_1_-8_-9_-10_-11_pos.pkl ../$results/ARF2_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n ARF2_regulated_vs_non_middle_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/ARF2_up_2_-8_-9_-10_-11_pos.pkl ../$results/ARF2_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n ARF2_regulated_vs_non_high_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/ARF2_up_3_-8_-9_-10_-11_pos.pkl ../$results/ARF2_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n ARF2_regulated_vs_non_low_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

############### down regulated #############

python get_interdistances.py  -pos ../$results/MP_down_1_-8_-9_-10_-11_pos.pkl ../$results/MP_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n MP_regulated_vs_non_middle_down_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/MP_down_2_-8_-9_-10_-11_pos.pkl ../$results/MP_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n MP_regulated_vs_non_high_down_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/MP_down_3_-8_-9_-10_-11_pos.pkl ../$results/MP_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n MP_regulated_vs_non_low_down_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/ARF2_down_1_-8_-9_-10_-11_pos.pkl ../$results/ARF2_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n ARF2_regulated_vs_non_middle_down_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/ARF2_down_2_-8_-9_-10_-11_pos.pkl ../$results/ARF2_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n ARF2_regulated_vs_non_high_down_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 

python get_interdistances.py  -pos ../$results/ARF2_down_3_-8_-9_-10_-11_pos.pkl ../$results/ARF2_not_regulated_-8_-9_-10_-11_pos.pkl -th -8 -9 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n ARF2_regulated_vs_non_low_down_th.svg -load -leg "regulated (th=-8)" "not regulated (th=-8)" "regulated (th=-9)" "not regulated (th=-9)" 


######### regulated vs non regulated #######

# python get_interdistances.py  -pos ../$results/regulated_promoters_-8_-9_-10_-11_pos.pkl -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n ARF_regulated_vs_non_regulated.svg -load 

python get_interdistances.py  -pos ../$results/up_regulated_promoters_-8_-9_-10_-11_pos.pkl -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n ARF_up_regulated_vs_non_up_regulated.svg -load 

python get_interdistances.py  -pos ../$results/down_regulated_promoters_-8_-9_-10_-11_pos.pkl -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n ARF_down_regulated_vs_non_down_regulated.svg -load 



exit 0
