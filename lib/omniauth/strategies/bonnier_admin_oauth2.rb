require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class BonnierAdminOauth2 < OmniAuth::Strategies::OAuth2
      args [:client_id, :client_secret, :site]

      option :site
      option :name, "bonnier_admin_oauth2"
      option :client_options, {
        authorize_url:      '/oauth/authorize',
        token_url:          '/oauth/token'
      }

      uid { raw_info["id"].to_s }

      info do
        {
          email: raw_info["email"],
          first_name: raw_info["first_name"],
          last_name: raw_info["last_name"]
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def raw_info
        @raw_info ||= access_token.get('/api/users/current.json').parsed
      end

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, deep_symbolize(options.client_options).merge(site: options.site))
      end
    end
  end
end
