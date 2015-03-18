class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.editor?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def create?
    user.editor? || user.author?
  end

  def update?
    user.editor? or user.author?
  end

  def destroy?
    user.editor? && !record.published?
  end

  def publish
    @user.editor?
  end
end
