class PaiementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    is_admin?
  end

  def show?
    is_admin?
  end

  def create?
    is_admin_or_customer?
  end

  def avoir?
    is_admin_or_customer?
  end

  def new?
    create?
  end

  def update?
    is_admin?
  end

  def edit?
    update?
  end

  def destroy?
    is_admin?
  end

  def settle_status?
    is_admin?
  end

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
