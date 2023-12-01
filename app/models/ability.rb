class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Recipe
    can :destroy, Recipe, user_id: user.id
  end
end