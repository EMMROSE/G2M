class SessionPolicy < ApplicationPolicy
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

  def display?
    true
  end

  # def caisse?
  #   is_admin?
  # end

  def validation?
    is_admin?
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

  def list?
    true
  end


  private

  def is_admin?
    user.admin
  end
end
