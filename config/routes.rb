Rails.application.routes.draw do
  devise_for :users #ユーザー機能に必要なルーティングを一気に生成してくれるdeviseのメソッド
  # localhost:3000にアクセスした場合、masksコントローラのindexアクションが発動
  root to: "masks#index"
  resources :masks
end
