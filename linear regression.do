import delimited data/train.csv
keep if item_category_id == 3 | item_category_id == 12 | item_category_id == 20
drop v1
gen dmy=date( date ,"DMY")
gen year=year(dmy)
bys shop_id year: egen mean_sales = mean( item_cnt_day)
sort mean_sales
reg item_cnt_day i.shop_id i.item_category_id
reg item_cnt_day i.shop_id i.item_category_id if year == 2013
reg item_cnt_day i.shop_id i.item_category_id if year == 2014
reg item_cnt_day i.shop_id i.item_category_id if year == 2015
