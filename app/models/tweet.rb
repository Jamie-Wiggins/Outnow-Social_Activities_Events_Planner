class Tweet < ApplicationRecord
    belongs_to :user

    def self.pull_tweets(user, user_id)
        Tweet.delete(all.where("user_id = ?", user_id))
            TwitterApi.test_tweets(user).each do |tweet|
            create!(
                data: tweet.text,
                twitter_user: user_id,
                user_id: user_id
            )
        end
    end

    validates :data, presence: true
    validates :user, presence: true
    validates :twitter_user, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
