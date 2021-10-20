class MovieCast

  attr_reader :cast

  def initialize(results)
    @cast = results[:cast]
  end

  def first_10_cast_members
    @first_10 = []
    @first_10 << @cast[0]
    @first_10 << @cast[1]
    @first_10 << @cast[2]
    @first_10 << @cast[3]
    @first_10 << @cast[4]
    @first_10 << @cast[5]
    @first_10 << @cast[6]
    @first_10 << @cast[7]
    @first_10 << @cast[8]
    @first_10 << @cast[9]

    @first_10
  end
end
