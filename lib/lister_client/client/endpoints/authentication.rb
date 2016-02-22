module ListerClient
  class Client
    module Endpoints
      module Authentication

        def sign_in(email:, password:)
          post('/auth/sign_in', query: {email: email, password: password})
        end

        def sign_out
          delete('/auth/sign_out')
        end

        def sign_up(email:, password:)
          post('/auth', query: {email: email, password: password})
        end

      end
    end
  end
end