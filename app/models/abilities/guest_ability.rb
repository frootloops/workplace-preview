class GuestAbility < Ability
  def main
    super
    place
    workstation
  end

  private

  def place
    can :index, Place
  end

end
