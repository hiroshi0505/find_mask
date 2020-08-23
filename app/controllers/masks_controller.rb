class MasksController < ApplicationController
  # indexアクションへのリダイレクトを繰り返して無限ループが起こる対策でexcept: :indexとしている
  before_action :move_to_index, except: [:index, :show, :search]

  # @masksというインスタンス変数に、masksテーブルのレコードを全て代入
  # この@masksは、ビューファイルで使用
  def index
    @masks = Mask.includes(:user).paginate(page: params[:page], per_page: 1).order("created_at DESC") # DESC降順/ASC昇順に並び替え
  end

  def new
    @mask = Mask.new
  end

  def create
    @mask = Mask.new(mask_params) # 生成したインスタンスを、インスタンス変数maskに代入し、下の式で使う
    if @mask.save # もし保存できたら
      redirect_to masks_path # TopPageに移動
    # redirect_to root_path # TopPageに移動
    else # 保存できなければ
      render :new # newアクションに飛ぶ
    end
  end

  def edit
    @mask = Mask.find(params[:id])
  end

  def update
    mask = Mask.find(params[:id])
    mask.update(mask_params)
    redirect_to root_path
  end

  def show
    @mask = Mask.find(params[:id])
    @comment = Comment.new
    @comments = @mask.comments.includes(:user)
  end

  def destroy
    mask = Mask.find(params[:id])
    if mask.destroy
      redirect_to root_path
    end
  end

  def search
    @masks = Mask.search(params[:keyword])
  end
  
  private

  def mask_params # masksテーブルにはimageとtextを保存
    params.require(:mask).permit(:image, :text).merge(user_id: current_user.id)
  end

  # 未ログイン状態のユーザーは、indexアクションにリダイレクト
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end