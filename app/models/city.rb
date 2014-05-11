class City < ActiveRecord::Base
  validates_presence_of :name, :lat, :lon
end
