class ProjectPolicy < ApplicationPolicy
  attr_accessor :user, :project

  def create?
    user.editor? || user.author?
  end

  def update?
    user.editor? || user.author?
  end

  def destroy?
    user.editor? || !record.image_processed?
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
      scope.all
    end
  end
end
