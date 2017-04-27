class ArticlePolicy < ApplicationPolicy
  attr_accessor :user, :article

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
      if @user.editor?
        scope.all
      elsif @user.author?
        scope.where(author_id: user.id)
      else
        scope.where(published: true)
      end
    end
  end
end
