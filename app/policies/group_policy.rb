class GroupPolicy < ApplicationPolicy
  def index?
    true
  end
  
  def show?
    true
  end

  def new?
    true
  end

  def edit?
    user.id == record.user.id || record.admin_user?(user)
  end
end