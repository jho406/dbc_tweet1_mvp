get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/:username' do
  @user = Bird.find_or_create_by_handle(params[:username])
  if not @user.tweets_stale?
    @tweets = @user.tweets.limit(10)
  end
  erb :index
end

get '/ajax/:username' do
  @user = Bird.find_or_create_by_handle(params[:username])
  @user.fetch_tweets!
  @tweets = @user.tweets.limit(10)
  erb :_tweets
end

# get '/:username' do
#   Twitter.user_timeline(params[:username], :count=>10)[0..9].map{|x|"#{x[:text]}</br>"} 
# end