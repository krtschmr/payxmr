class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :coin, null: false
      t.string :alias, null: false, index: true
      t.string :address, null: false, index: true
      t.string :uuid, null: false, index: true, unique: true
      t.string :secret, null: false, index: true, unique: true
      t.timestamps
    end

    add_index :addresses, [:coin, :alias], unique: true
  end
end
