class RentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      record.user == user
    end
  end

  def new?
    record.user != user
  end

  def create?
    record.user != user
  end
end
