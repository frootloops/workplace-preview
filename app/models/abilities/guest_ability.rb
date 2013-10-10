class GuestAbility < Ability
  def main
    super
    place
    workstation
    event
    master
    promo
  end

  private

  def place
    can :index, Place
  end

  def master
    can :read, Master
  end

end
