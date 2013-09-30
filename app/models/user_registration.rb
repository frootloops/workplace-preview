class UserRegistration

  def initialize(auth)
    @provider = auth["provider"]
    @auth = auth
  end

  def find_for_provider
    if provider = Provider.find_by(name: @provider, uid: @auth["uid"])
      provider.user
    else
      build_from_auth
    end
  end

  def build_from_auth(params=nil)
    user = User.new do |user|
      user.email = @auth["info"]["email"]
      user.name = @auth["info"]["name"]
      user.attributes = params
    end
    user.providers.build(name: @provider, uid: @auth["uid"])
    user
  end

end
