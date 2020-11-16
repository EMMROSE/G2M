class ProposalMailer < ApplicationMailer

# Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gift_mailer.confirmation.subject
  #
  def information(selection)
    @selection = selection

    mail(
      to:       @selection.fournisseur.email,
      subject:  "Votre dépôt chez Graîne de mômes"
    )
    # mail(:to => @selection.fournisseur.email, :subject => "Votre dépôt chez Graîne de mômes") do |format|
    #   format.text # renders send_report.text.erb for body of email
    #   format.pdf do
    #     attachments["Récapitulatif de la sélection No. #{@selection.id} du #{@selection.date}.pdf"] = WickedPdf.new.pdf_from_string(
    #       render_to_string(:pdf => "Récapitulatif de la sélection No. #{@selection.id} du #{@selection.date}.", page_size: 'A4', :template => 'selections/show.html.erb')
    #     )
    #   end
    # end
  end

  def generatecsv(csv)
    attachments['import_products.csv'] = {mime_type: 'text/csv', content: csv}
    mail(to: 'bonjour@grainedemomes.com', subject: 'My CSV')
  end

end
