class MoviesController < ApplicationController
  def index
    if params["movie_title"]
      movie_keyword = params["movie_title"]
      response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1&include_adult=false") do |req|
        req.params['query'] = movie_keyword
      end
      parsed = JSON.parse(response.body, symbolize_names: true)  
      @search_results = parsed[:results].map do |result|
        Film.new(result)
      end.first(40)
    else
      page1 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1")
      page2 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=2")

      page_1_response = JSON.parse(page1.body, symbolize_names: true)
      page_2_response = JSON.parse(page2.body, symbolize_names: true)
      @results = page_1_response[:results] + page_2_response[:results]

      @top_40 = @results.map do |result|
        Film.new(result)
      end
    end
  end

  def show
  end
end
