
class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Pipoca Agil')
<<<<<<< HEAD
=======


>>>>>>> 614e7e88ae50f920215e698d64d3fe62b0ac0e5b
  end
end
