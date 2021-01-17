class ProductPolicy < ApplicationPolicy
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

  def sold_status?
    is_admin?
  end

  def tosell_status?
    is_admin?
  end

  def return_status?
    is_admin?
  end

  def edit_price?
    is_admin?
  end

  def save_price?
    is_admin?
  end

  def change_price?
    is_admin?
  end

  def duplicate?
    is_admin?
  end

  def import?
    true
  end

  def stock4pro?
    true
  end

  def select4pro?
    true
  end

  def devis4pro?
    true
  end

  private

  def is_admin?
    user.admin
  end

  def is_admin_or_customer?
    if user.admin
      return true
    elsif user.email == Selection.last.fournisseur.email
      return true
    else
      return false
    end
  end

end
