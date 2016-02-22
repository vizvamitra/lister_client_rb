module ListerClient
  class Client
    module Connection
      module TokenAuth
        extend ActiveSupport::Concern

        AUTH_HEADERS =  ['client', 'access-token', 'token-type', 'expiry', 'uid']

        included do |klass|
          klass.instance_eval do
            set_callback :request, :before, :set_auth_headers
            set_callback :request, :after, :update_auth_headers
          end
        end

        class_methods do
          def auth_headers
            @auth_headers ||= {}
          end

          def auth_headers= new_headers
            @auth_headers = new_headers
          end
        end

        private

          def set_auth_headers
            headers.merge!(self.class.auth_headers)
          end

          def update_auth_headers
            all_headers = response.headers

            new_headers = all_headers.select{|k,_| AUTH_HEADERS.include?(k)}
            new_headers.each{|k,v| new_headers[k] = v[0] }

            self.class.auth_headers = new_headers if new_headers.any?
          end
      end
    end
  end
end