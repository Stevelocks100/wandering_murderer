execute unless data entity @s data.aj_entry run function aj_data_manager_patch:store_data

execute if function aj_data_manager_patch:valid_data run function aj_data_manager_patch:store_data



execute unless function aj_data_manager_patch:valid_data run function aj_data_manager_patch:fix_data