class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.editor?
        scope.all
      elsif !user.nil?
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end

  def create?
    !user.unauthenticated?
  end

  def update?
    user.editor? || user.author?
  end

  def destroy?
    user.editor? || !record.published?
  end

  def publish
    @user.editor?
  end
end
