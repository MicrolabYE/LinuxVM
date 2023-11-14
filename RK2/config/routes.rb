Rails.application.routes.draw do
  get 'rk2/view'
  get 'rk2/input'
  get 'rk2/input'
  get 'rk2/view'
  get 'rk2' => 'rk2#input'
  root 'rk2#input'
end
