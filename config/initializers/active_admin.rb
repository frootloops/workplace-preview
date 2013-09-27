ActiveAdmin.setup do |config|
  config.site_title = "Workplace"

  # == User Authentication
  config.authentication_method = :authenticate_admin_user!

  # == User Authorization
  #
  # Active Admin will automatically call an authorization
  # method in a before filter of all controller actions to
  # ensure that there is a user with proper rights. You can use
  # CanCanAdapter or make your own. Please refer to documentation.
  # config.authorization_adapter = ActiveAdmin::CanCanAdapter

  # You can customize your CanCan Ability class name here.
  # config.cancan_ability_class = "Ability"

  # You can specify a method to be called on unauthorized access.
  # This is necessary in order to prevent a redirect loop which happens
  # because, by default, user gets redirected to Dashboard. If user
  # doesn't have access to Dashboard, he'll end up in a redirect loop.
  # Method provided here should be defined in application_controller.rb.
  # config.on_unauthorized_access = :access_denied

  # == Current User
  config.current_user_method = :current_user


  # == Logging Out
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :delete

  # == Batch Actions
  config.batch_actions = true

  config.allow_comments = false
end
