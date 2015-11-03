class UserPolicy
	
	class Scope
    attr_reader :current_user, :model
	
		def initialize(current_user, model)
			@current_user = current_user
			@user = model	
		end

    def resolve
      if @current_user.admin?
         @user.all
      else
         [@current_user]
      end
    end
  end

	attr_reader :current_user, :model
	
	def initialize(current_user, model)
		@current_user = current_user
		@user = model	
	end

	def index?
		@current_user.present?	
	end

	def show?
		@current_user.admin? || @current_user == @user
	end

	def update?
		@current_user.admin? || @current_user == @user
	end

	def destroy?
		false if @current_user == @user
		@current_user.admin?
	end

end