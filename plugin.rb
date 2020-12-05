# name: discourse-performance-testing
# about: Modifications for performance testing
# version: 0.1
# authors: Angus McLeod
# url: https://github.com/paviliondev/discourse-performance-testing
  
enabled_site_setting :performance_testing_enabled

after_initialize do
  add_model_callback(:application_controller, :before_action) do
    RateLimiter.disable if params[:disable_ratelimits]
  end
end