class Hashtag < ActiveRecord::Base
  has_many :tags
  has_many :tweets, through: :tags

  def self.find_tags tweet
    tag_expression = Regexp.new('\b?#\S+')
    tags = tweet.content.scan(tag_expression)
    tags.each do |tag_match|
      tag = self.find_tag tag_match
      tweet.hashtags << tag
    end
  end
  def self.find_tag tag_match
    self.find_or_create_by(tag: tag_match)
  end
end

