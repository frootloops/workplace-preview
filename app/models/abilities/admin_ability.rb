class AdminAbility < Ability
  def main
    can :manage, :all
  end
end
