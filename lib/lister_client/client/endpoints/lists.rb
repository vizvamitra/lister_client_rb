module ListerClient
  class Client
    module Endpoints
      module Lists

        def lists
          get('/lists')['lists']
        end

        def list(id)
          get("/lists/#{id}")
        end

        def create_list(options)
          post('/lists', query: get_list_options(options))
        end

        def update_list(id, options)
          patch("/lists/#{id}", query: get_list_options(options))
        end

        def delete_list(id)
          delete("/lists/#{id}")
        end

        private

          def get_list_options(options)
            {list: {
              name: options.fetch(:name)
            }}
          end
      end
    end
  end
end