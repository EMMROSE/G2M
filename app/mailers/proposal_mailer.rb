class ProposalMailer < ApplicationMailer

# Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gift_mailer.confirmation.subject
  #
  def proposal(selection)
    @selection = selection
    attachments["Sélection n° #{@selection.id} du #{@selection.date}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'Sélection n° #{@selection.id} du #{@selection.date}.', template: 'selections/show.html.erb', layout: 'pdf.html', page_size: 'A4', background: false, no_background: true, lowquality: true, zoom: 1, dpi: 300, encoding:"UTF-8")
    )
    # mail(to: todo.owner.email, subject: 'Your todo PDF is attached', todo: todo)
    mail(
      to:       @selection.fournisseur.email,
      subject:  "Votre dépôt chez Graîne de mômes"
    )
  end

  def generatecsv(csv)
    attachments['import_products.csv'] = {mime_type: 'text/csv', content: csv}
    mail(to: 'bonjour@grainedemomes.com', subject: 'Nouveau CSV pour Shopify')
  end

end
