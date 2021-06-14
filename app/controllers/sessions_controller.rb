class SessionsController < ApplicationController
  include CurrentUserConcern
  def create
    user = User.find_by(email: params['user']['email']).try(:authenticate, params['user']['password'])
    if user
      Session.create(user_id: user.id)
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if Session.any?
      render json: {
        logged_in: true,
        user: User.find(Session.first.user_id)
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    Session.delete_all
    render json: { status: 200, logged_out: true }
  end
end
