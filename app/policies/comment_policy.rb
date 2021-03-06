class CommentPolicy < ApplicationPolicy
  attr_accessor :user, :comment

  def create?
    user.editor? || user.author?
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

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user || User.new
      @scope = scope
    end

    def resolve
      if user.editor?
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end
end
