class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  has_one :bird
  after_create :seconds_passed

  def seconds_passed=
    self.seconds_passed = self.created_at - self.tweeted_at
  end
end
