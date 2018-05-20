require 'ransack'

class MainController < ApplicationController
  before_action :force_json, only: :search

  def index
  end

  def search
    @pokemons = Pokemon.ransack(title_cont: params[:q]).result(distinct: true).limit(40)
    render json: @pokemons
  end

  private

  def force_json
    request.format = :json
  end
end