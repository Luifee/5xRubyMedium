class PagesController < ApplicationController

  before_action :find_memo, only: [:show]

  def index
    @memos = Memo.published_memos.take(6)
  end

  def show
    @memo = Memo.friendly.find(params[:memo_id])
  end

  def user
  end

  private
  def find_memo
    @memo = Memo.friendly.find(params[:memo_id])
  end

end
