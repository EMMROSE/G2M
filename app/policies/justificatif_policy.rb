class JustificatifPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def create?
    is_admin_or_customer?
  end

  def new?
    create?
  end

  # def update?
  #   is_admin?
  # end

  # def edit?
  #   update?
  # end


  private

  def is_admin?
    user.admin
  end

  def is_admin_or_customer?
    if user.admin
      return true
    else
      return true
    end
  end
end
