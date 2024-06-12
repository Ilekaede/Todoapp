Rails.application.routes.draw do
  # Taskリスト用のルートを設定する
  resources :todos
  root "todos#index"

end
