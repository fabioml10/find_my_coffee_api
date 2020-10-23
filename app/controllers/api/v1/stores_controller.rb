class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [:show]

  def show; end

  def index
    @stores = Store.within(params[:longitude].to_f, params[:latitude].to_f, params[:distance_in_km].to_i)
      .sort_by { |store| store.ratings_average }
      .reverse
  end

  private

    def set_store
      # ! dá erro 404 se não encontrado
      @store = Store.find_by!(google_place_id: params[:id])
    end



end
