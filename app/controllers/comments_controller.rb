class CommentsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  
  def create
    @beat = Beat.find(params[:beat_id])
    @comment = @beat.comments.create(comment_params)
    
    flash[:notice] = "Comment successfully added" if @comment.save
    respond_with( @comment, :layout => !request.xhr? )
  end
  
  
  def destroy
    @beat = Beat.find(params[:beat_id])
    @comment = @beat.comments.find(params[:id])    

    flash[:notice] = "Comment successfully removed" if @comment.destroy
    respond_with( @comments, :layout => !request.xhr? )
  end
 
  private
    def comment_params
      params.require(:comment).permit(:user_id, :body)
    end  
end
