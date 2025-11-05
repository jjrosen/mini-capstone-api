class Product < ApplicationRecord

def is_discounted
  true if price < 10
end

def tax
  tax = price * 0.09 
 return tax
end

def total 
  total = price * 1.09
  return total
end

end
