class ApplicationController < ActionController::Base
  include CustomerSessionsHelper
  include Admin::SessionsHelper
end
