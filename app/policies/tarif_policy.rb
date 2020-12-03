class TarifPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    is_admin?
  end

  def new?
    create?
  end


  private

  def is_admin?
    user.admin
  end
end
