class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.integer :original_tweet_id
      t.string  :content, limit: 140

      t.timestamps null: false
    end
  end
end
