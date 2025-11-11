class Product < ApplicationRecord

  validates :name, presence: true
  validates :inventory, presence: true
  validates :price, numericality: { greater_than: 0}

  def is_discounted
    if price < 10
      true
    else
      false
    end
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def tax
    @tax = price * 0.09 
  "$#{@tax.round(2)}"
  end

  def total 
    tax
    total = price + @tax
    "$#{total.round(2)}"
  end

  def price_money_sign
    "$#{price}"
  end

  def easy_created_at
    created_at.strftime("%m/%d/%Y%l:%M %p")
  end

  def easy_updated_at
    updated_at.strftime("%m/%d/%Y%l:%M %p")

  end
end
