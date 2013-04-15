class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.references :bird
      t.datetime :tweeted_at
      t.integer :seconds_passed
      t.timestamps
    end
  end
end
