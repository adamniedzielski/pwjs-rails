ActiveAdmin.register City do

  permit_params :name, :lon, :lat
end
