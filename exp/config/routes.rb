Rails.application.routes.draw do
  root "calc#view"
  get 'calc/input', to: "calc#input"
  get 'calc/view', to: "calc#view"
end
