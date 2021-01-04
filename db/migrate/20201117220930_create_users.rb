class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_reference :events, :user, foreign_key: true
  end
end
