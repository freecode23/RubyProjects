class UserGamePolicy < ApplicationPolicy
  def index?
    true # - user:   the `current_user` signed in with Devise.
  end

  def show?
    true
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
