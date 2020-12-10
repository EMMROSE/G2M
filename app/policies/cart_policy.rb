class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def devis?
    is_pro?
  end

  private

  def is_pro?
    user.pro
  end
end
