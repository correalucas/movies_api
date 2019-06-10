module V1
  class LibrariesController < ApplicationController
    def index
      libraries = current_user.libraries
                              .alive
                              .order(:created_at)
                              .page(page)

      render json: serializer.new(libraries, include: [:user, :catalogue])
    end

    private

    def serializer
      LibrarySerializer
    end

    def page
      params[:page] || 1
    end
  end
end
