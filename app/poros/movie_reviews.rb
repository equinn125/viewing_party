class MovieReviews

  attr_reader :total_results, :reviews

  def initialize(results)
    @total_results = results[:total_results]
    @reviews = results[:results]
  end

  # def contents
  #   @contents = []
  #   results[:results].each do |result|
  #     @contents << result[:content]
  #   end
  # end

  
end
