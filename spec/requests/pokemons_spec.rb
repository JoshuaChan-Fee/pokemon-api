require 'rails_helper'

RSpec.describe 'Pokemon API', type: :request do
  # initialize test data
  let!(:pokemons) {
    Pokemon.create(number: 1, name: 'test2', typeOne: 'type1',
      typeTwo: 'type2', total: 10, hp: 2,
      attack: 1, defense: 1, specialAttack: 1,
      specialDefense: 1, speed: 1, generation: 2,
      legendary: false)
    Pokemon.create(number: 2, name: 'test2', typeOne: 'type1',
      typeTwo: 'type2', total: 10, hp: 2,
      attack: 1, defense: 1, specialAttack: 1,
      specialDefense: 1, speed: 1, generation: 2,
      legendary: false)
  }

  let(:pokemon_id) { Pokemon.first.id }

  # Test suite for GET /pokemons
  describe 'GET /pokemons' do
    it 'returns pokemons' do
      get pokemons_url
      expect(response).to be_successful
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

  end

  # Test suite for GET /pokemons/:id
  describe 'GET /pokemons/:id' do
    before { get "/pokemons/#{pokemon_id}" }

    context 'when the record exists' do
      it 'returns the pokemon' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(pokemon_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for POST /pokemons
  describe 'POST /pokemons' do
    # valid payload
    let(:valid_attributes) { 
      { pokemon: { 
          number: 3, name: 'test3', typeOne: 'type1',
          typeTwo: 'type2', total: 10, hp: 2,
          attack: 1, defense: 1, specialAttack: 1,
          specialDefense: 1, speed: 1, generation: 2,
          legendary: false 
        } 
      }
    }

    let(:invalid_attributes) { 
      { pokemon: { 
          name: 111, typeOne: 'type1',
          typeTwo: 'type2', total: 10, hp: 2,
          attack: 1, defense: 1, specialAttack: 1,
          specialDefense: 1, speed: 1, generation: 2,
          legendary: false 
        } 
      }
    }

    context 'when the request is valid' do
      before { post '/pokemons', params: valid_attributes }

      it 'creates a pokemon' do
        expect(json['name']).to eq('test3')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/pokemons', params: invalid_attributes }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end

  # Test suite for PUT /pokemons/:id
  describe 'PUT /pokemons/:id' do
    let(:valid_attributes) { 
      { pokemon: { 
          number: 100, name: 'testPut', typeOne: 'type1',
          typeTwo: 'type2', total: 10, hp: 2,
          attack: 1, defense: 1, specialAttack: 1,
          specialDefense: 1, speed: 1, generation: 2,
          legendary: false 
        } 
      }
    }

    context 'when the record exists' do
      before { put "/pokemons/#{pokemon_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /pokemons/:id
  describe 'DELETE /pokemons/:id' do
    before { delete "/pokemons/#{pokemon_id}" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
