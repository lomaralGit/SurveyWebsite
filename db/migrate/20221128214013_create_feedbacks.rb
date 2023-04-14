class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.references :presentation, null: false, foreign_key: true
      t.string :feedback
      t.integer :score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
