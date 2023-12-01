class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Recipe
    can [:create, :update, :destroy], Recipe, user_id: user.id
  end
end
