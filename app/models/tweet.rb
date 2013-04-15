class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  has_one :bird
  after_create :add_seconds_passed

  def add_seconds_passed
    puts ("hiiii")
    self.seconds_passed = self.created_at - self.tweeted_at
    save
  end
end
