class NotifyMailer < ApplicationMailer
  default from: "notification@milknthingzz.com"

  def notify_sale
    @email = params[:email]
    @order = params[:order]
    @url = admin_orders_url + "/#{@order}"
    
    mail(to: @email,
         subject: "Milknthingzz sold a craft! #{@order}",
         template_name: "notify")
  end
end