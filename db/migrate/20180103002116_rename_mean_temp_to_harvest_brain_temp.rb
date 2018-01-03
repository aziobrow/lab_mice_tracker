class RenameMeanTempToHarvestBrainTemp < ActiveRecord::Migration[5.1]
  def change
    rename_column :mice, :mean_temp, :harvest_brain_temp
  end
end
