module API
  module V1
    class Books < Grape::API
      resources :books do
        get '/', jbuilder: 'books/index' do
          @books = Book.all
        end

        route_param :id, type: Integer do
          get '/', jbuilder: 'books/show' do
            @book = Book.find(params[:id])
            end
        end
      end
    end
  end
end
