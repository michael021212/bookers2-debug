module API
  class Root < Grape::API
    format :json
    formatter :json, Grape::Formatter::Jbuilder

    mount API::V1::Root
  end
end
