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
#rm ../results/figure/*.pkl
# cd ../lib/get_interdistances_program 
# python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/MP_up_1.fas -th -8 -9 -10 -11 -neg ../$results/MP_up_2.fas -points True -o ../$results -n MP_test.svg -or 2 -ol 2 -save 
# python get_interdistances.py   -pos ../$results/MP_up_1_-8_-9_-10_-11_pos.pkl ../$results/MP_up_1_-8_-9_-10_-11_pos.pkl -th -10 -neg ../$results/MP_up_2_-8_-9_-10_-11_neg.pkl -points True -o ../$results -n MP_test.svg -or 2 -ol 2 -load -leg test1 test2 

# exit 0

####### regulated regions #################
cd ../lib/get_interdistances_program

python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/MP_up_1.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n MP_up_middle_th.svg -or 2 -ol 2 -save 
python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/MP_up_2.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n MP_up_high_th.svg -or 2 -ol 2 -save &
python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/MP_up_3.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n MP_up_low_th.svg -or 2 -ol 2 -save &

python get_interdistances.py -mat $matrix_wh_ARF2  -maxInter 30 -pos ../$results/ARF2_up_1.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF2_up_middle_th.svg -or 2 -ol 2 -save &
python get_interdistances.py -mat $matrix_wh_ARF2  -maxInter 30 -pos ../$results/ARF2_up_2.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF2_up_high_th.svg -or 2 -ol 2 -save &
python get_interdistances.py -mat $matrix_wh_ARF2  -maxInter 30 -pos ../$results/ARF2_up_3.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF2_up_low_th.svg -or 2 -ol 2 -save &



python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/MP_down_1.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n MP_down_middle_th.svg -or 2 -ol 2 -save &
python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/MP_down_2.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n MP_down_high_th.svg -or 2 -ol 2 -save &
python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/MP_down_3.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n MP_down_low_th.svg -or 2 -ol 2 -save &

python get_interdistances.py -mat $matrix_wh_ARF2  -maxInter 30 -pos ../$results/ARF2_down_1.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF2_down_middle_th.svg -or 2 -ol 2 -save &
python get_interdistances.py -mat $matrix_wh_ARF2  -maxInter 30 -pos ../$results/ARF2_down_2.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF2_down_high_th.svg -or 2 -ol 2 -save &
python get_interdistances.py -mat $matrix_wh_ARF2  -maxInter 30 -pos ../$results/ARF2_down_3.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF2_down_low_th.svg -or 2 -ol 2 -save &



####### non regulated regions #################

python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/MP_not_regulated.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n MP_not_regulated.svg -or 2 -ol 2 -save &

python get_interdistances.py -mat $matrix_wh_ARF2  -maxInter 30 -pos ../$results/ARF2_not_regulated.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF2_not_regulated.svg -or 2 -ol 2 -save &

########## regulated vs non regulated ############

python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/regulated_promoters.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF_regulated.svg -or 2 -ol 2 -save &

python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/down_regulated_promoters.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF_regulated.svg -or 2 -ol 2 -save &


python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/up_regulated_promoters.fas -th -8 -9 -10 -11 -neg ../$results/non_regulated_promoters.fas -points True -o ../$results -n ARF_up_regulated.svg -or 2 -ol 2 -save &


########## bound vs not bound  ############

python get_interdistances.py -mat $matrix_wh_MP  -maxInter 30 -pos ../$results/promoters_intersect_MP.fas -th -8 -9 -10 -11 -neg ../$results/promoters_wo_MP.fas -points True -o ../$results -n MP_bound_vs_unbound.svg -or 2 -ol 2 -save &

python get_interdistances.py -mat $matrix_wh_ARF2  -maxInter 30 -pos ../$results/promoters_intersect_ARF2.fas -th -8 -9 -10 -11 -neg ../$results/promoters_wo_ARF2.fas -points True -o ../$results -n ARF2_bound_vs_unbound.svg -or 2 -ol 2 -save &

python get_interdistances.py -mat $matrix_wh_ARF2  -maxInter 30 -pos ../$results/promoters_intersect_ARF2_MP.fas -th -8 -9 -10 -11 -neg ../$results/promoters_wo_ARF2_MP.fas -points True -o ../$results -n ARF2_MP_bound_vs_unbound.svg -or 2 -ol 2 -save &


exit 0
