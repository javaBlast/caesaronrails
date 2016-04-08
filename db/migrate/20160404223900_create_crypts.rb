class CreateCrypts < ActiveRecord::Migration
  def change
    create_table :crypts do |t|
      t.string :decrypt
      t.string :encrypt
      t.integer :shift

      t.timestamps null: false
    end
  end
end
