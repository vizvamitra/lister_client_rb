require 'lister_client/client/connection/token_auth'
require 'lister_client/client/connection/request'

module ListerClient
  class Client
    module Connection

      def get(path, options={})
        request(:get, path, options)
      end

      def post(path, options={})
        request(:post, path, options)
      end

      def patch(path, options={})
        request(:patch, path, options)
      end

      def delete(path, options={})
        request(:delete, path, options)
      end

      private

        def request(http_method, path, options)
          request = Request.new(http_method, path, options)
          request.perform
        end

    end
  end
end