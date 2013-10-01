class ClientAbility < Ability
  def main
    place
    user_ability
  end

  private

  def place
    can :index, Place
    can :crud, Place, owner_id: user.id
  end

  def user_ability
    can :show, User, id: user.id
  end

end
