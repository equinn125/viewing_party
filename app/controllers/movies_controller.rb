class MoviesController < ApplicationController
  def index
    @movies = if params[:search].present?
                MoviesFacade.search(params[:search])
              else
                MoviesFacade.top_40_movies
              end
  end
  def show
    @movie = MoviesFacade.details(params[:id])
    @movie_review = MoviesFacade.reviews(params[:id])
    @movie_cast = MoviesFacade.cast(params[:id])
  end
end
