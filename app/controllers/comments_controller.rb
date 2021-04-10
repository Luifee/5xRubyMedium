class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_memo

  def create
    @comment = @memo.comments.new(comment_params)
    @comment.user = current_user

    unless @comment.save
      render js: "alert('Error!');"
    end
  end

  private
  def find_memo
    @memo = Memo.friendly.find(params[:memo_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
