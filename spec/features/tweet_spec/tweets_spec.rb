require 'spec_helper'

describe create_tweets do
  it "creates a database" do
    tweet_table = db_connection.table_exist?(:create_tweets)
    expect(tweet_table).to be_truthy
  end
end
