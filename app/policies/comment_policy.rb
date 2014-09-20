class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def destroy?
    user.present? && user.can_moderate?
  end
end