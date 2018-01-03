class Mouse < ApplicationRecord
  enum status: ['live', 'harvested']

  scope :experiment_start_date, -> start_date { where(experiment_start_date: start_date) }
  scope :harvest_date, -> harvest_date { where(harvest_date: harvest_date) }
  scope :date_of_birth, -> birth_date { where(:date_of_birth => birth_date) }
  scope :trisomic, -> trisomic_value { where(:trisomic => trisomic_value) }
  scope :diet, -> diet_type { where(:diet => diet_type) }
  scope :color, -> color { where(:color => color) }
  scope :sex, -> gender { where(:sex => gender) }
  scope :group, -> group_no { where(:group => group_no) }
  scope :status, -> status { where(:status => status) }
  scope :id, -> mouse_id { where(:original_id => mouse_id) }
  scope :protein_ug_per_ml, lambda { |protein_ug_per_ml:| where("protein_ug_per_ml > ? AND protein_ug_per_ml < ?", protein_ug_per_ml, protein_ug_per_ml + 1) }
  scope :harvest_brain_temp, lambda { |harvest_brain_temp:| where("harvest_brain_temp > ? AND harvest_brain_temp < ?", harvest_brain_temp, harvest_brain_temp + 1) }
  scope :weight_in_grams, lambda { |weight_in_grams:| where("weight_in_grams> ? AND weight_in_grams < ?", weight_in_grams, weight_in_grams + 1) }
end
