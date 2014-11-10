class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.integer :game_id
      t.integer :user_id
      t.string  :number
      t.timestamps
    end
  end
end
