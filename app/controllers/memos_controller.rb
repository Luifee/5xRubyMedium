class MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :find_memo, only: [:edit, :update, :destroy]

  def index
    @memos = current_user.memos.order(created_at: :desc)
  end

  def new
    @memo = current_user.memos.new
  end

  def create
    @memo = current_user.memos.new(memo_params)
    @memo.publish! if params[:publish]

    if @memo.save
      if params[:publish]
        redirect_to memos_path, notice: "筆記成功發布"
      else
        redirect_to edit_memo_path(@memo), notice: "草稿成功儲存"
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
      case
      when params[:publish]
        @memo.publish!
	redirect_to memos_path, notice: "筆記成功發表"
      when params[:unpublish]
        @memo.unpublish!
	redirect_to memos_path, notice: "筆記已撤回"
      else
        redirect_to edit_memo_path(@memo), notice: "草稿成功儲存"
      end
    else
      render :edit
    end
  end

  def destroy
    @memo.destroy
    redirect_to memos_path, notice: "筆記成功刪除"
  end

  private
  def find_memo
    @memo = current_user.memos.friendly.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:title, :content, :cover_image)
  end

end
