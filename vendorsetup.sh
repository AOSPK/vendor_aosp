for combo in $(curl -s https://raw.githubusercontent.com/KrakenProject/hudson/master/lineage-build-targets | sed -e 's/#.*$//' | grep lineage-16.0 | awk '{printf "lineage_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
