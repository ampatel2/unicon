class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :category
      t.string :title
      t.string :symbol
      t.string :dimension
      t.float :anchor_value
      t.string :accuracy

      t.timestamps
    end
  end
end
