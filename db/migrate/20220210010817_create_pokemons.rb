class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer :number
      t.string :name
      t.string :typeOne
      t.string :typeTwo
      t.integer :total
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :specialAttack
      t.integer :specialDefense
      t.integer :speed
      t.integer :generation
      t.boolean :legendary

      t.timestamps
    end
  end
end
