require 'csv'
Pokemon.destroy_all

CSV.foreach('pokemon.csv', :headers => true) do |row|
  Pokemon.create(number: row['#'], name: row['Name'], typeOne: row['Type 1'],
  typeTwo: row['Type 2'], total: row['Total'], hp: row['HP'],
  attack: row['Attack'], defense: row['Defense'], specialAttack: row['Sp. Atk'],
  specialDefense: row['Sp. Def'], speed: row['Speed'], generation: row['Generation'],
  legendary: row['Legendary'])
end