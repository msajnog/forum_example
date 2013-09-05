class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :last_poster_id
      t.datetime :last_poster_at

      t.timestamps
    end
  end
end
