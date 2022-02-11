require 'csv'
class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /pokemons or /pokemons.json
  def index
    @pokemons = Pokemon.paginate :page => params[:page], :per_page => 20
    render json: @pokemons
  end

  # GET /pokemons/1 or /pokemons/1.json
  def show
    @pokemon = Pokemon.find(params[:id])
    render json: @pokemon
  end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons or /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)
      if @pokemon.save
        render json: @pokemon
      else
        render error: { error: 'Unable to create Pokemon' }, status: 400
      end
  end

  # PATCH/PUT /pokemons/1 or /pokemons/1.json
  def update
    if @pokemon
      @pokemon.update(pokemon_params)
      render json: { message: 'Pokemon successfully updated' }, status: 200
    else
      render json: { error: 'Unable to update Pokemon' }, status: 400
    end
  end

  # DELETE /pokemons/1 or /pokemons/1.json
  def destroy
    if @pokemon
      @pokemon.destroy
      render json: { message: 'Pokemon successfully deleted' }, status: 200
    else
      render json: { error: 'Unable to delete Pokemon' }, status: 400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:number, :name, :typeOne, :typeTwo, :total, :hp, :attack, :defense, :specialAttack, :specialDefense, :speed, :generation, :legendary)
    end
end
