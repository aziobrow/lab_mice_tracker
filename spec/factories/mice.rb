FactoryBot.define do
  factory :mouse do
    sequence(:original_id)  {|n| "4587-#{n}"}
    trisomic false
    protein_ug_per_ml 2.6145
    diet "Cont"
    color "Agouti"
    sex "Male"
    date_of_birth "6/19/2011"
    experiment_start_date "10/17/2011"
    harvest_date "12/20/2011"
    group "6"
    mean_temp 93.2
    weight_in_grams 39.8
  end
end
