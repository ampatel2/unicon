class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.string :category
      t.text :comment

      t.timestamps
    end
  end
end
