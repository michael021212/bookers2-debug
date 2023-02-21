module API
  module V1
    class Root < Grape::API
      version 'v1', using: :path

      mount API::V1::Books

      # 404NotFoundの扱い
      route :any, '*path' do
        error! I18n.t('grape.errors.not_found'), 404
      end

      # swaggerの設定
      if defined? GrapeSwaggerRails
        add_swagger_documentation(
          api_version: 'v1',
          base_path: '/api',
          hide_documentation_path: true,
          hide_format: true)
      end
    end
  end
end
