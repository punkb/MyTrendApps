class HomeController < ApplicationController
	before_filter :load_tweet
 #before_filter :count
 
  def load_tweet

    #initializing All Required Arrays
    @topTrends = []
    @temp = []  
    @tenTrends = [] 
    @ten_Name = []
    @count = []
    @time = []
    #Initialization Ends !

    #Initializing Client with Users credentials 

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

    #get the top trends from twitter API call
    #Store the trend Names into an Array (@temp)
    #call Twitter API Search for each trend 
    #Collect the retweet counts for each trend Name (@finalArray)
    #collect each tweet of the trends into trendtweets DB
    #Save New data to database (TrendName, TrendCounts)

    @topTrends  = @client.trends() 
      @topTrends.each do |t|
      @temp << t.name  
      end

    @finalArray = [] #to collect the retweet counts
    for i in 0..9
      trends = Trends.new()
      trend_tweets = Trendtweets.new() 
      @t = 0 
      @FirstTrend = @client.search(@temp[i])
      @FirstTrend.each do |t| 
        @t = @t + t.retweet_count 
        trend_tweets.trend = @temp[i]
        trend_tweets.tweet = t.text
        trend_tweets.save
      end 
        @finalArray << @t
        trends.trendCounts = @finalArray[i]
        trends.trendName = @temp[i]
        trends.save
    end 

    @trendtweets = Trendtweets.all.order("trend")





     #@tenTrends = Trends.last(10)
     # @tenTrends.each do |d|
     #    @ten_Name << d.trendName
     #end
      @graph_trend_name = @temp[0]
      @trendsData = Trends.where(trendName: @graph_trend_name)
      @trendsData.each do |d|
        @count << d.trendCounts
        @time << d.created_at.to_i*1000
      end

      # Get 2D array containing 1st trends Reqteet count as per time @graphArray = [[time,count]]
      @graphArray = Array.new(@count.length){Array.new(2) {0} }
      for i in 0..(@count.length-1)
        @graphArray[i][0] = @time[i].to_i
        @graphArray[i][1] = @count[i]  
      end
       
 end 




 def getTrendData #returns retweet counts for DB for perticular trends 
  foo = params[:foo_params]
  @graph_trend_name = foo
  @count = []
    @time = []
    @trendsData = Trends.where(trendName: @graph_trend_name)
        @trendsData.each do |d|
        @count << d.trendCounts
        @time << d.created_at.to_i*1000
    end
     @graphArray = Array.new(@count.length){Array.new(2) {0} }
      for i in 0..(@count.length-1)
        @graphArray[i][0] = @time[i].to_i
        @graphArray[i][1] = @count[i]  
      end

  
end
end

