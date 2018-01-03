class Api::V1::Mice::SearchController < ApplicationController
  def index
    if search_params[:protein_ug_per_ml]
      render json: Mouse.where(protein_ug_per_ml: search_params[:protein_ug_per_ml].to_i..search_params[:protein_ug_per_ml].to_i + 1)
    elsif search_params[:harvest_brain_temp]
      render json: Mouse.where(harvest_brain_temp: search_params[:harvest_brain_temp].to_i..search_params[:harvest_brain_temp].to_i + 1)
    elsif search_params[:weight_in_grams]
      render json: Mouse.where(weight_in_grams: search_params[:weight_in_grams].to_i..search_params[:weight_in_grams].to_i + 1)
    else
      render json: Mouse.where(search_params)
    end
  end

private
    def search_params
      params.permit(
        :id,
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
