class Checkout 

  attr_reader :cart, :receipt

  def initialize
  @cart = []
  @receipt = 0
  end

  def add_to_cart(item)
    @cart.push(item)
  end

  def total(list)
    list.split("").map { |i| i == i.downcase ? next : add_to_cart(i) }[0]
    list.length > cart.length ? -1 : final_bill
  end

  def final_bill
    a_count = 0
    b_count = 0
    @cart.map do |x|
      if x == "A"
        @receipt += 50
        a_count += 1
        a_count == 3 ? (@receipt -= 20; a_count = 0) : next
      elsif x == "B"
        @receipt += 30
        b_count += 1
        b_count == 2 ? (@receipt -= 15; b_count = 0) : next
      elsif x == "C"
        @receipt += 20
      elsif x == "D"
        @receipt += 15
      end
    end
    @receipt
  end

end
