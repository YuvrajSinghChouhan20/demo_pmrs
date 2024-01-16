class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Property
    return  unless user.present?
    if user.has_role?(:user) || user.has_role?(:tenant)
      can [:create, :read], Property, user: user
      can :show, Property  # Allow tenant to show a property
    end
    if user.has_role?(:tenant)
      can [:read, :update], Agreement, user: user
    end
    if user.has_role? :landlord
      can [:read, :create], Agreement, user: user
      can :manage, Property, user: user
    end
  end
end
