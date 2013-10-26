require 'warden'
require 'devise/strategies/authenticatable'

module GoogleAppsOpenSocial

  class Strategy < Devise::Strategies::Authenticatable

    def valid?
      params[:banana].present?
    end

    def authenticate!
      user = mapping.to.find_by_email(params[:email])
      return fail(:not_found_in_database) unless user
      success! user
    end

  end

end

Warden::Strategies.add(:google_apps_open_social, GoogleAppsOpenSocial::Strategy)