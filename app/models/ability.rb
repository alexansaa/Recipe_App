class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Recipe
    can [:create], Recipe
    can [:update, :destroy], Recipe, user_id: user.id

    can [:create, :destroy], RecipeFood, recipe: { user_id: user.id }
  end
end
