class Bird < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!
    Twitter.user_timeline(self.handle, :count=>10)[0..9].map{|x| self.tweets << Tweet.create(body: "#{x[:text]}", tweeted_at: x[:created_at])} 
  end

  def tweets_stale?
    self.tweets.empty? ||
    Time.now - self.tweets.last.created_at > rand(942) ||
    (self.tweets.average(:seconds_passed) > 942) 
  end
end
