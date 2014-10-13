class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end
  
  def new
    @topic = Topic.new
    authorize @topic
  end
  
  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    authorize @topic
  end
  
  def edit
    @topic = Topic.find(params[:id])
    authorze @topic
  end
  
  def create
    @topic = current_user.topic.build(post_params)
    authroize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end
  
  def update
    @topic = current_user.topic.build(post_params)
    authorize @topic
    if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again"
      render  :edit
    end
    
    private
    def topic_params
      params.require(:topic).permit(:title, :body)
    end
    
  end 
end