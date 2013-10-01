class GuestAbility < Ability
  def main
    super
    place
  end

  private

  def place
    can :index, Place
  end
end
