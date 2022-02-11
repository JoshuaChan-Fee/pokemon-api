require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it 'has a number' do
    pokemon = Pokemon.new(
      name: 'test',
      typeOne: 'typeOne',
      typeTwo: 'typeTwo',
      total: 1,
      hp: 1,
      attack: 1,
      defense: 1,
      specialAttack: 1,
      specialDefense: 1,
      speed: 1,
      generation: 1,
      legendary: true
    )
    expect(pokemon).to_not be_valid
    pokemon.number = 1
    expect(pokemon).to be_valid
  end

  it 'has a name' do
    pokemon = Pokemon.new(
      number: 1,
      typeOne: 'typeOne',
      typeTwo: 'typeTwo',
      total: 1,
      hp: 1,
      attack: 1,
      defense: 1,
      specialAttack: 1,
      specialDefense: 1,
      speed: 1,
      generation: 1,
      legendary: true
    )
    expect(pokemon).to_not be_valid
    pokemon.name = "test"
    expect(pokemon).to be_valid
  end
end

