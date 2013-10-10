class ClientAbility < Ability
  def main
    super
    place
    user_ability
    provider
    workstation
    event
    event_user
    master
    reservation
  end

  private

  def place
    can :index, Place
    can :crud, Place, owner_id: user.id
  end

  def user_ability
    can :show, User, id: user.id
  end

  def provider
    can :create, Provider
    can :destroy, Provider, user_id: user.id
  end

  def event_user
    can [:create, :index], EventUser
    can :destroy, EventUser, user_id: user.id
  end

  def reservation
    can :crud, Reservation, master_id: user.id
  end

  def master
    can :read, Master
    can [:edit, :update], Master, id: user.id
  end
end
