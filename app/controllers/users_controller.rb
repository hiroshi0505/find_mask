class UsersController < ApplicationController
  def show
    # コメント欄に表示されるユーザー名をクリックすることで、
    # 送られたidをparamsで取得し、
    # そのユーザーのレコードを変数userに代入し下の式で使用します
    # @users = User.paginate(page: params[:page], per_page: 1)
    user = User.find(params[:id])
    @nickname = user.nickname
    @masks = user.masks
  end
end
