#/bin/bash

wget http://api.worldbank.org/v2/en/indicator/SI.POV.GINI?downloadformat=csv

unzip SI.POV.GINI?downloadformat=csv

cp API_SI.POV.GINI_DS2_en_csv_v2.csv soal.csv

awk '
BEGIN {
        RS=""
        FS="\n"
        OFS=","
}
{
        max=-9999999
        min=9999999
        sum=0
        for(i=5;i<=NF;++i) {
                split($i,r,",")
                if (r[61]>max) { max=r[61] }
                if (r[61]<min) { min=r[61] }
                sum+=r[61]
        }
        print r[1],r[3],r[4],NF,sum,min,max/NF
}' soal.csv
