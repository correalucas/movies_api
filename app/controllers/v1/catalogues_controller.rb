module V1
  class CataloguesController < ApplicationController
    # GET v1/catalogues?page=1
    def index
      catalogues = Catalogue.order(:created_at).page(page)
      render json: serializer.new(catalogues, include: [:episodes, :options]) if stale?(catalogues)
    end

    # GET v1/movies?page=1
    def movies
      movies = Catalogue.movies.order(:created_at).page(page)
      render json: serializer.new(movies, include: [:options]) if stale?(movies)
    end

    # GET v1/seasons?page=1
    def seasons
      seasons = Catalogue.seasons.order(:created_at).page(page)
      render json: serializer.new(seasons, include: [:episodes, :options]) if stale?(seasons)
    end

    private

    def serializer
      CatalogueSerializer
    end

    def page
      params[:page] || 1
    end
  end
end
