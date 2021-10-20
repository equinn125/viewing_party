class MoviesService
  class << self
    def get_data(endpoint)
      response = Faraday.get(endpoint)
      JSON.parse(response.body, symbolize_names: true)
    end

    def top_40
      first = get_data("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['API_KEY']}&language=en-US&page=1")
      second = get_data("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['API_KEY']}&language=en-US&page=2")
      first[:results] + second[:results]
    end

    def movie_search(title)
      one = get_data("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['API_KEY']}&language=en-US&query=#{title}&page=1&include_adult=false")
      two = get_data("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['API_KEY']}&language=en-US&query=#{title}&page=2&include_adult=false")
      one[:results] + two[:results]

    end

    def movie_details(movie_id)
      details = get_data("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['API_KEY']}&language=en-US")
    end

    def movie_reviews(movie_id)
      reviews = get_data("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['API_KEY']}&language=en-US&page=1")
    end

    def movie_cast(movie_id)
      cast = get_data("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV['API_KEY']}&language=en-US")
    end
  end
end
