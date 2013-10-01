class ClientAbility < Ability
  def main
    place
  end

  private

  def place
    can :index, Place
    can :crud, Place, owner_id: user.id
  end
end
