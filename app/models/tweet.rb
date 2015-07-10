class Tweet < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  before_validation(on: :create){ create_hashtags }

  belongs_to :user
  has_many :tags
  has_many :hashtags, through: :tags

  def create_hashtags
    Hashtag.find_tags self
  end

  def display_content
    tag_expression = Regexp.new('\b?#\S+')
    string = self.content
    string.match(tag_expression)
    string.gsub!(tag_expression){|match_tag|
      tag = Hashtag.find_by tag: match_tag
      "<a href='/hashtags/#{tag.id}'>#{match_tag}</a>"
    }
    self.content
  end
end
