class UsersController < ApplicationController
  def show
    # コメント欄に表示されるユーザー名をクリックすることで、
    # 送られたidをparamsで取得し、
    # そのユーザーのレコードを変数userに代入し下の式で使用します
    user = User.find(params[:id])
    @nickname = user.nickname
    @masks = user.masks
  end
end
