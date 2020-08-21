class MasksController < ApplicationController
  # indexアクションへのリダイレクトを繰り返して無限ループが起こる対策
  before_action :move_to_index, except: :index

  # @masksというインスタンス変数に、masksテーブルのレコードを全て代入
  # この@masksは、ビューファイルで使用
  def index
    @masks = Mask.all
  end

  private
  # もしユーザーがログインしていなかったらindexアクションにリダイレクトする
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
