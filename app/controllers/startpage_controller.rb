class StartpageController < ActionController::Base
	def show
   	 self.resource = resource_class.new()
 	end

 	helper_method def resource
      instance_variable_get(:"@#{resource_name}")
  	end

	helper_method def resource_name
 	   :user
	end
	
	alias :scope_name :resource_name

	def resource_class
	  User
	end

	  def resource=(new_resource)
    instance_variable_set(:"@#{resource_name}", new_resource)
  end
  
end