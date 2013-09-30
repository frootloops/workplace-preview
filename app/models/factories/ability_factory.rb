class AbilityFactory
  def self.build(user)
    klass = if user.guest?
      GuestAbility
    elsif user.client?
      ClientAbility
    elsif user.admin?
      AdminAbility
    end

    klass.new user
  end
end
