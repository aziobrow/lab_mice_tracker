class Api::V1::Mice::SearchController < ApplicationController
  has_scope :experiment_start_date
  has_scope :harvest_date
  has_scope :date_of_birth
  has_scope :trisomic
  has_scope :diet
  has_scope :color
  has_scope :sex
  has_scope :group
  has_scope :status
  has_scope :id

  has_scope :protein_ug_per_ml do |controller, scope, value|
    scope.protein_ug_per_ml(protein_ug_per_ml: value.to_i)
  end

  has_scope :harvest_brain_temp do |controller, scope, value|
    scope.harvest_brain_temp(harvest_brain_temp: value.to_i)
  end

  has_scope :weight_in_grams do |controller, scope, value|
    scope.weight_in_grams(weight_in_grams: value.to_i)
  end

  def index
    render json: apply_scopes(Mouse).all
  end

private
    def search_params
      params.permit(
        :id,
        :original_id,
        :protein_ug_per_ml,
        :color,
        :date_of_birth,
        :trisomic,
        :diet,
        :sex,
        :experiment_start_date,
        :harvest_date,
        :group,
        :harvest_brain_temp,
        :weight_in_grams,
        :status)
    end
end
