class ContainerContent < ActiveRecord::Base

  belongs_to    :container
  belongs_to    :product
  belongs_to    :lot
  belongs_to    :product_status
  belongs_to    :receipt_line
  belongs_to    :order_line
  
  validates_presence_of :quantity 

end