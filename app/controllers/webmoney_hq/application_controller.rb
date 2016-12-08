module WebmoneyHq
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    NotAuthorized = Class.new(StandardError)
    rescue_from ApplicationController::NotAuthorized do |exception|
      render_error_page(status: 403, text: 'Forbidden')
    end

    BadRequest = Class.new(StandardError)
    rescue_from ApplicationController::BadRequest do |exception|
      render_error_page(status: 400, text: 'lastupdate incorrect')
    end

    private

    def render_error_page(status:,text:)
      respond_to do |format|
        format.xml do
          render xml: {error: text}.to_xml(root: 'error'), status: status
        end
        format.any do
          head status
        end
      end
    end
  end
end
