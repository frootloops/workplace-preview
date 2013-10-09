class GuestAbility < Ability
  def main
    super
    place
    workstation
    event
    master
  end

  private

  def place
    can :index, Place
  end

end
