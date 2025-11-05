class Product < ApplicationRecord

def is_discounted
  if price < 10
    true
  else
    false
  end
end

def tax
  tax = price * 0.09 
 "$#{tax}"
end

def total 
  total = price * 1.09
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
