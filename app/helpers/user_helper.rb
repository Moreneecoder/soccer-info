module UserHelper
    def user_errors
      if @user.errors.any?
        render 'user_errors'
      end
    end
end
