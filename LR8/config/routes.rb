Rails.application.routes.draw do
  root "lr8#input"
  get 'lr8/input', to: "lr8#input"
  get 'lr8/view', to: "lr8#view"
end
