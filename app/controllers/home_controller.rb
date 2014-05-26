class HomeController < ApplicationController
	def show 
   load_tweet  
  end
 
  def load_tweet

    #initializing All Required Arrays
    @topTrends = []
    @temp ||= []  
    @tenTrends = [] 
    @count = []
    @time = []
   
    @client = Twitter::REST::Client.new do |config|
              config.consumer_key = Rails.application.config.twitter_key
              config.consumer_secret = Rails.application.config.twitter_secret
              if current_user.nil?
                config.access_token = "54292452-QPFHB62vk7HzkFz2IqfQjMopjLo5p6dZGnmUuRchE"
              else 
                config.access_token = current_user.oauth_token
                config.access_token_secret = current_user.oauth_secret
              end  #Initializing Client with Users credentials 
    end

   
    @allTrends = Trends.all
    @topTrends = Trends.last(10)
      @topTrends.each do |t|
      @temp << t.trendName  
      end

     # @balance = current_user.balance

@user_timeline = @client.home_timeline

  end 

  def retweet_count
    load_tweet
    getTrendData
 @retweet_count_array = []

  end

  def getTrendData  #returns retweet counts for DB for perticular trends 
    load_tweet
    @count = []
    @time = []
    if params[:foo_params]
      @graph_trend_name = params[:foo_params]
    else
      @graph_trend_name = @temp[0]
    end
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
  respond_to do |format|
    format.html
    format.json {render :json => @trendsData }
  end

  def account
    load_tweet
    @newamount = params[:balance]
   
      
    @user = User.where(uid: current_user.uid)


#@current_balance = @user.balance
 #   @newamount = (@balance.to_i) + ((params[:foo_params]).to_i)
  #  @current_balance.update_attributes!(@newamount)


      @user.each do |t|
        

        t.balance = t.balance + @newamount.to_i
         t.save
      end

   
   redirect_to root_path


   
  end


end

