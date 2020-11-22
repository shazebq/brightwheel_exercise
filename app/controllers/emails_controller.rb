class EmailsController < ApplicationController

  def send_email
    @email = Email.new(email_params)
    if @email.valid?
      @email.after_validation_callback
      response = RestClient.post Rails.application.config.mailgun_endpoint,
                      :from => "#{@email.from_name} <#{@email.from}>",
                      :to => @email.to,
                      :subject => @email.subject,
                      :text => @email.body
      if response.code == 200
        render(:json => {:message => 'Your email was sent!'}, :status => 200)
      else
        render(:json => {:message => 'There was an error'}, :status => 400)
      end
    else
      render(:json => {:errors => @email.errors.full_messages.join(', ')}, :status => 500)
    end
  end

  private

  def email_params
    params.require(:email).permit(Email.attr_list)
  end

end
