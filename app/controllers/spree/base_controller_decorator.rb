module Spree
  BaseController.class_eval do
    before_filter :foo
 
    def foo
#      binding.pry
    end
  end
end
