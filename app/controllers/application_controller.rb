class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :home

  # before_action :login_new # try to create a modal
  before_action :pro_cart
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  #after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private
  # def login_new # try to create a modal
  #   @new_user = User.new
  # end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = "Cet accès vous est refusé."
    redirect_to(root_path)
  end

  def pro_cart
    if user_signed_in? && current_user.pro
      @current_cart = current_user.cart
      if @current_cart == nil
        @current_cart = Cart.create(user: current_user)
        session[:cart_id] = @current_cart.id
      else
        session[:cart_id] = @current_cart.id
      end
    else
      @current_cart == nil
    end
  end
end



