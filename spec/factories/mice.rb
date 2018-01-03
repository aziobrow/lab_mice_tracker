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
    group_number "6"
    harvest_brain_temp 93.2
    weight_in_grams 39.8
    status 1

    factory :mouse_trisomic_true do
      trisomic true
    end

    factory :mouse_high_protein do
      protein_ug_per_ml 3.045
    end

    factory :mouse_rapa_diet do
      diet "rapa"
    end

    factory :mouse_black do
      color "black"
    end

    factory :mouse_female do
      sex "Female"
    end

    factory :mouse_born_yesterday do
      date_of_birth Date.yesterday
    end

    factory :mouse_started_today do
      experiment_start_date Date.today
    end

    factory :mouse_harvested_tomorrow do
      harvest_date Date.tomorrow
    end

    factory :mouse_group_twelve do
      group_number "12"
    end

    factory :mouse_low_temp do
      harvest_brain_temp 88.9
    end

    factory :mouse_heavy do
      weight_in_grams 40.2
    end

    factory :mouse_live do
      status 0
    end
  end
end
