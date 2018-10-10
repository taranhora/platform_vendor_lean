for combo in $(curl -s  https://raw.githubusercontent.com/LeanOS-Project/platform_vendor_lean/lean-9.x/lean.devices | sed -e 's/#.*$//' | awk '{printf "lean_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
