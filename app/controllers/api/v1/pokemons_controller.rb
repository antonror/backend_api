module Api::V1
  class PokemonsController < ApplicationController
    def index
      @pokemons = Pokemon.order("created_at DESC")
      render json: @pokemons
    end

    def create
      @pokemon = Pokemon.create(pokemon_params)
      render json: @pokemon
    end

    def update
      @pokemon = Pokemon.find(params[:id])
      @pokemon.update_attributes(pokemon_params)
      render json: @pokemon
    end

    def destroy
      @pokemon = Pokemon.find(params[:id])
      if @pokemon.destroy
        head :no_content, status: :ok
      else
        render json: @pokemon.errors, status: :unprocessable_entity
      end
    end

    private

    def pokemon_params
      params.require(:pokemon).permit(:title, :body)
    end
  end
end