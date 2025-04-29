class UserMailer < ApplicationMailer
  default from: "do-not-reply@milknthingzz.xyz"

  def welcome_email
    @user = params[:user]
    @url = "https://milknthingzz.xyz/sign_up"
    mail(to: @user.email, subject: "Thanks For Signing Up To Milknthingzz")
  end
end
