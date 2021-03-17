class RentalPdf < Prawn::Document
  def initialize(customer_movie_stock_user)
    super(top_margin: 70)
    @customer_movie_stock_user = customer_movie_stock_user
    rental_id
    line_items
  end

  def rental_id
    text "Rental \##{@customer_movie_stock_user.id}", size: 30, style: :bold
  end

  def line_items
    move_down 20
    table [[1, 2], [3, 4]]
  end

  def line_item_rows

  end

end
