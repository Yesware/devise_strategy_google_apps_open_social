require "warden"
require "devise"
require "devise/strategies/google_apps_certificate"

module Devise
  module Strategies
    class GoogleAppsOpenSocial < Devise::Strategies::Authenticatable

      include GoogleAppsCertificate

      def valid?
        params[:xoauth_public_key] == CERTIFICATE_NAME
      end

      def authenticate!
        consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET)

        begin
          signature = OAuth::Signature.build(request) do
            [nil, consumer.secret]
          end

          return fail(:invalid_signature) unless signature.verify

        rescue OAuth::Signature::UnknownSignatureMethod => e
          return fail(:unknown_signature_method)
        end

        resource = mapping.to.find_by_opensocial_viewer_id(params[:opensocial_viewer_id])
        
        return fail(:resource_not_found) unless resource

        success!(resource)
      end

    end
  end
end

Warden::Strategies.add(:google_apps_open_social, Devise::Strategies::GoogleAppsOpenSocial)