class BookPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    owner?
  end
end