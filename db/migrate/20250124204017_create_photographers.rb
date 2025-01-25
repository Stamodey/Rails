class CreatePhotographers < ActiveRecord::Migration[8.0]
  def change
    create_table :photographers do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.string :email
      t.string :portfolio

      t.timestamps
    end
  end
end
