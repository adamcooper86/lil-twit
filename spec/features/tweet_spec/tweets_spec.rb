require 'spec_helper'

describe "create_tweets" do
  it "creates a new tweet" do

    expect { Tweet.create(user_id: 1, original_tweet_id: 1, content: "this tweet is amazing!") }.to change{Tweet.count}.by(1)
  end
end
