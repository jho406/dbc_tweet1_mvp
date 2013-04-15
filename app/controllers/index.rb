get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/:username' do
  @user = Bird.find_or_create_by_handle(params[:username])
  if @user.tweets_stale?
    puts "hi this is new tweets!"
    @user.fetch_tweets!
  end
  @tweets = @user.tweets.limit(10).pluck(:body).inspect
end

# get '/:username' do
#   Twitter.user_timeline(params[:username], :count=>10)[0..9].map{|x|"#{x[:text]}</br>"} 
# end