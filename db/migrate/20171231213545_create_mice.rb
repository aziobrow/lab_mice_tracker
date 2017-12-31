class CreateMice < ActiveRecord::Migration[5.1]
  def change
    create_table :mice do |t|
      t.string :original_id
      t.boolean :trisomic
      t.float :protein_ug_per_ml
      t.string :diet
      t.string :color
      t.string :sex
      t.string :date_of_birth
      t.string :experiment_start_date
      t.string :harvest_date
      t.string :group
      t.float :mean_temp
      t.float :weight_in_grams

      t.timestamps
    end
  end
end
