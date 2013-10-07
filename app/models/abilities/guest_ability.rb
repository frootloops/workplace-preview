class GuestAbility < Ability
  def main
    super
    place
    workstation
    event
  end

  private

  def place
    can :index, Place
  end

end
