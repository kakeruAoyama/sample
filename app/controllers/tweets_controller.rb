class TweetsController < ApplicationController

    before_action :authenticate_user!
    
    def index
        @tweets = Tweet.all 
        if params[:search]
            #部分検索
         @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%')
        else
         @tweets = Tweet.all
        end
    end

    def new
        @tweet = Tweet.new
    end 

    def create
        @tweet = Tweet.new(tweet_params)

        @tweet.user_id = current_user.id
           
        if @tweet.save
            redirect_to action: 'index'
        else
            redirect_to action: 'new'
        end
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def show
        
        @tweet = Tweet.find(params[:id])
    end
    
    

    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(tweet_params)
          redirect_to :action => "show", :id => @tweet.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        Tweet.find(params[:id]).destroy
        redirect_to action: :index
    end

    #def user
     #   @user = User.find(params[:id])
    #end


    private
    def tweet_params
        params.require(:tweet).permit(:body,:image)
    end

end
