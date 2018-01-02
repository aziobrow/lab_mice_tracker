class Api::V1::Mice::SearchController < ApplicationController
  def index
    render json: Mouse.where(search_params)
  end

private
    def search_params
      params.permit(:id, :protein_ug_per_ml, :color, :date_of_birth, :trisomic, :diet, :sex, :experiment_start_date, :harvest_date, :group, :mean_temp, :weight_in_grams)
    end
end
