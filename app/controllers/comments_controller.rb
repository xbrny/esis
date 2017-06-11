class CommentsController < ApplicationController

  def create
    @subject = Subject.find(params[:subject_id])
    @comment = Comment.new(comment_params)
    @comment.subject = @subject
    @comment.user = User.first
    if @comment.save
      flash[:success] = "Comment was successfully posted"
      redirect_to subject_path(@subject)
    else
      flash[:danger] = "Failed to post comment"
      redirect_to subject_path(@subject)
    end
  end

  def destroy
    @subject = Subject.find(params[:subject_id])
    @comment = @subject.comments.find(params[:id])
    @comment.destroy
    flash[:danger] = "Comment was successfully deleted"
    redirect_to subject_path(@subject)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
