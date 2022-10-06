class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :manage, Food
    can :manage, RecipeFood, recipe_id: user.id
    can :manage, Recipe, user:
  end
end
