class Ability
  include CanCan::Ability

  def initialize(user)
    @_user = user
    make
    main
  end

  def main
  end

  def make
    alias_action :create, :read, :update, :destroy, to: :crud
  end

  def user
    @_user
  end
end
