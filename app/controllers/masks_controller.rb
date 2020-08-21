class MasksController < ApplicationController

  # @masksというインスタンス変数に、masksテーブルのレコードを全て代入
  # この@masksは、ビューファイルで使用
  def index
    @masks = Mask.all
  end
end
