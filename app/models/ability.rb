class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Property

    return unless user.present?
    # Define abilities for users with the role :user
    if user.has_role?(:user)
      can :read, :create, Property
      # can :new, Property
    end

    # Define abilities for users with the role :tenant
    if user.has_role?(:tenant)
      can :show, Property  # Allow tenant to show a property
    end

    # Define abilities for users with the role :landlord
    if user.has_role?(:landlord)
      # can [:read, :update, :create], Booking
      can :manage, Property
      can [:new, :create, :read], Agreement
    end

    # Define additional abilities for users with the role :tenant
    if user.has_role?(:tenant)
      can  :update, Agreement, user: user
    end
  end
end
