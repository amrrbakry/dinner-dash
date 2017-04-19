class RenameAdditionalChargeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :values, :addtional_charge, :additional_charge
  end
end
