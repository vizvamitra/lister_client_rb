module ListerClient
  class Client
    module Connection
      class Request
        include HTTParty
        format :json
        base_uri 'http://lister.midia-dev.ru'

        include ActiveSupport::Callbacks
        define_callbacks :request

        include ListerClient::Client::Connection::TokenAuth

        attr_accessor :query, :headers, :http_method, :path
        attr_reader :response

        def initialize(http_method, path, options)
          @query = options.fetch(:query, {})
          @headers = options.fetch(:headers, {})
          @http_method = http_method
          @path = path
          @response = nil
        end

        def perform
          run_callbacks :request do
            @response = self.class.send(http_method, path, query: query, headers: headers)
            response.success? ? parse_body(response) : raise_error(response)
          end
        end

        private

          def parse_body(response)
            response.body.empty? ? '' : parse_json(response.body)
          end

          def raise_error(response)
            code = response.code
            message = "request failed with code #{code}"
            errors = parse_body(response).fetch('errors', [])
            errors = errors.join(', ') if errors.is_a? Array
            message += ": #{errors}"

            raise RequestError, message
          end

          def parse_json(raw_json)
            JSON.parse(raw_json)
          end
      end
    end
  end
end