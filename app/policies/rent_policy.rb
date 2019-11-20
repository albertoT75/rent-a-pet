class RentPolicy < ApplicationPolicy
  def create?
    # record.user != user
    true
  end
end
