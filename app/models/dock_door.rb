class DockDoor < ActiveRecord::Base

	belongs_to	:warehouse
	validates	:name, :direction, :warehouse_id, :presence => true
	validates	:name, :scope => :warehouse_id, :uniqueness => true

  def self.directions
    ["Inbound", "Outbound", "Both"]
  end

end
