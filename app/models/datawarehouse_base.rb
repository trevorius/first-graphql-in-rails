class DatawarehouseBase < ActiveRecord::Base
    self.abstract_class = true
    establish_connection DATAWAREHOUSE
  end