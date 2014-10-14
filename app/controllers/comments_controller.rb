class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments
    
    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post
    
    authorize! :create, @comment, message: "You need to be signed in to do that."
    if @comment.save
      flash[:notice] = "Created comment."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error saving comment. Please try again."
      render 'post/show'
    end
    
    def destroy
      @topic = Topic.find(params[:topics_id])
      @post = @topic.posts.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      
      authorize @comment
      if @comment.destroy
        flash[:notice] = "Comment removed."
        redirect_to [@topic, @post]
      else
        flash[:error] = "Comment couldn't be deleted. Try again."
        redirect_to [@topic, @post]
      end 
    end  
end
