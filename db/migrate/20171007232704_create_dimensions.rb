class CreateDimensions < ActiveRecord::Migration[5.1]
  def change
    create_table :dimensions do |t|
      t.string :title
      t.string :anchor
      t.string :source

      t.timestamps
    end
  end
end
