class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Recipe

    return unless user.present?

    can :read, :all
    can :manage, Food, user: user
    can :manage, RecipeFood, user: user
    can :manage, Recipe, user: user

  end
end
