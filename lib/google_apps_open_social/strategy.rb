require 'devise/strategies/authenticatable'

module GoogleAppsOpenSocial

  class Strategy < Authenticatable

    def valid?
      params[:awesome].present?
    end

    def authenticate!
      user = mapping.to.find_by_email(params[:email])
      return fail(:not_found_in_database) unless user
      success! user
    end

  end

end

Warden::Strategies.add(:google_apps_opensocial, GoogleAppsOpenSocial::Strategy)