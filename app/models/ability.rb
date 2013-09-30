class Ability
  include CanCan::Ability

  def initialize(user)
    @_user = user
    main
  end

  def main
  end

  def user
    @_user
  end
end
