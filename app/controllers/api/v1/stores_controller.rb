class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [:show]

  def show; end

  private

    def set_store
      # ! dá erro 404 se não encontrado
      @store = Store.find_by!(google_place_id: params[:id])
    end
end
