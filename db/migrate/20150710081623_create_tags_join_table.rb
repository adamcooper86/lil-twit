class CreateTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :hashtag_id
      t.integer :tweet_id
      t.timestamps null: false
    end
  end
end
