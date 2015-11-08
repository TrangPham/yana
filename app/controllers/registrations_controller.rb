class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
     params.require(:user).permit(:email, :name, :password, :password_confirmation, :category, :location, :birth_date, :gender, :bio)
  end
end
