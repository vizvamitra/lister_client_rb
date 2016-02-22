require 'lister_client/client/endpoints/authentication'
require 'lister_client/client/endpoints/lists'
require 'lister_client/client/endpoints/items'

module ListerClient
  class Client
    module Endpoints
      include Authentication
      include Lists
      include Items
    end
  end
end