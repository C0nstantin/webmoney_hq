Rails.application.routes.draw do

  mount WebmoneyHq::Engine , :at =>'/hq'
end
