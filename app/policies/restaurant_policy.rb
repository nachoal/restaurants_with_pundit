class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # This resolve method is for the index action
    # You have two keywords available
    # 1 - user: current_user
    # 2 - record: the instance variable that you authorized @restaurant 
    def resolve
      if user.admin?
        Restaurant.all
      else
        Restaurant.where(user: user)
      end
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    # @restaurant.user == current_user
    if user.admin?
      true
    else
      record.user == user
    end
  end

  def edit?
    # Remember that record is the instance var (@restaurant) that you are 
    # authorizing 👁
    if user.admin?
      true
    else
      record.user == user
    end
  end

  def update?
    if user.admin?
      true
    else
      record.user == user
    end
  end

  def destroy?
    if user.admin?
      true
    else
      record.user == user
    end
  end
end
