require 'lister_client/client/connection'
require 'lister_client/client/endpoints'

module ListerClient
  class Client
    include ListerClient::Client::Connection
    include ListerClient::Client::Endpoints

    def initialize
    end
  end
end