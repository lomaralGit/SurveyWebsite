class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :privileged
      t.string :name
      t.string :username
      t.string :password
      t.boolean :is_active

      t.timestamps
    end
  end
end
