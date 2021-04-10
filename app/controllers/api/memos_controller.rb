class Api::MemosController < Api::BaseController
  before_action :find_memo

  def clap
    @memo.increment!(:clap)
    render json: {status: @memo.clap}
  end

  def clip
    render json: {status: current_user.clip!(@memo)}
  end

  private

  def find_memo
    @memo = Memo.friendly.find(params[:id])
  end

end
