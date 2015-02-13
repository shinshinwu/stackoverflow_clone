Rails.application.routes.draw do


  root 'questions#index'

  resources :questions, except: :new do
    member do
      patch 'upvote', to: 'questions#upvote'
      patch 'downvote', to: 'questions#downvote'
    end
    resources :answers, only: [:create], param: :answer_id do
      member do
        patch 'upvote', to: 'answers#upvote'
        patch 'downvote', to: 'answers#downvote'
      end
    end
  end
end
