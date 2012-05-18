Spree::ShipmentMailer.class_eval do
  helper 'spree/base'

  def shipped_email(shipment, resend=false)
    @shipment = shipment
    I18n.locale = @shipment.order.locale
    subject = (resend ? "[#{t(:resend).upcase}] " : "")
    subject += "#{Spree::Config[:site_name]} #{t('shipment_mailer.shipped_email.subject')} ##{shipment.order.number}"
    mail(:to => shipment.order.email,
    :subject => subject)
  end
end
