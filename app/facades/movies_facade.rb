class MoviesFacade
  class << self
    def top_40_movies
      movie_data = MoviesService.top_40
      movie_data.map do |data|
        Movie.new(data)
      end
    end

    def search(title)
      data = MoviesService.movie_search(title)
      data.map do |data|
        Movie.new(data)
      end
    end

    def details(movie_id)
      data = MoviesService.movie_details(movie_id)
      Movie.new(data)
    end

    def reviews(movie_id)
      data = MoviesService.movie_reviews(movie_id)
      MovieReviews.new(data)
    end

    def cast(movie_id)
      data = MoviesService.movie_cast(movie_id)
      MovieCast.new(data)
    end
  end
end
