class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :number
      t.string :password
      t.string :token
      t.timestamps
    end
  end
end
