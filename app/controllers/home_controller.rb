class HomeController < ApplicationController
	before_filter :load_tweet
 #before_filter :count
 
  def load_tweet
   
    @topTrends = []
    @temp = []  
    @tenTrends = [] 
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key = Rails.application.config.twitter_key
    config.consumer_secret = Rails.application.config.twitter_secret
    if current_user.nil?
      config.access_token = "54292452-QPFHB62vk7HzkFz2IqfQjMopjLo5p6dZGnmUuRchE"
    else 
      config.access_token = current_user.oauth_token
      config.access_token_secret = current_user.oauth_secret
    end
    end
    @topTrends  = @client.trends() #get the top trends from twitter
    @topTrends.each do |t|
    @temp << t.name   #@temp contains names of all trends 
    end

     @tenTrends = Trends.last(10)


    @finalArray = [] #to collect the retweet counts
    for i in 0..9
      trends = Trends.new()
      @t = 0 
      @FirstTrend = @client.search(@temp[i])
      @FirstTrend.each do |t| 
        @t = @t + t.retweet_count 
      end 
        @finalArray << @t

         #add data in db: 
        trends.trendCounts = @finalArray[i]
        trends.trendName = @temp[i]
        trends.save
    end      
   
 end 
 def getTrendData #returns retweet counts for DB for perticular trends 
  foo = params[:foo_params]
  @count = []
    @time = []
    @trendsData = Trends.where(trendName: foo)
    @trendsData.each do |d|
      @count <<d.trendCounts
      @time << d.created_at
    end

  
end
end

