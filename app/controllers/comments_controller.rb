class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to "/store/#{comment.food.id}"
    else
      redirect_to :back, flash: {
        comment: comment,
        error_message: comment.errors.full_messages
      }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment_food_id = comment.food.id
    comment.delete
    redirect_to "/store/#{comment_food_id}", flash: {notice: "コメントが削除されました"}
  end

  private

  def comment_params
    params.require(:comment).permit(:food_id, :comment, :user_id)
  end
end
