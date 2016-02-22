module ListerClient
  class Client
    module Endpoints
      module Items

        def items(list_id)
          get("/lists/#{list_id}/items")['items']
        end

        def item(list_id, id)
          get("/lists/#{list_id}/items/#{id}")
        end

        def create_item(list_id, options)
          post("/lists/#{list_id}/items", query: get_item_options(options))
        end

        def update_item(list_id, id, options)
          patch("/lists/#{list_id}/items/#{id}", query: get_item_options(options))
        end

        def complete_item(list_id, id)
          post("/lists/#{list_id}/items/#{id}/completed")
        end

        def delete_item(list_id, id)
          delete("/lists/#{list_id}/items/#{id}")
        end

        private

          def get_item_options(options)
            {item: {
              body: options.fetch(:body)
            }}
          end

      end
    end
  end
end