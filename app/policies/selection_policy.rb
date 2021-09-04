class SelectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    is_admin?
  end

  def show?
    is_admin_or_customer?
  end

  def create?
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

  def etiquette?
    is_admin?
  end

  def csv?
    is_admin?
  end

  def mail?
    is_admin?
  end

  def summary?
    is_admin?
  end

  def return?
    is_admin?
  end

  private

  def is_admin?
    user.admin
  end

  def is_admin_or_customer?
    if user.admin
      return true
    elsif user.email == Selection.where(id: @fournisseur.id).first.fournisseur.email
      return true
    else
      return false
    end
  end

end
