class ProposalMailer < ApplicationMailer
  require 'date'
# Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gift_mailer.confirmation.subject
  #
  def proposal(selection)
    @selection = selection
    attachments["Sélection n° #{@selection.id} du #{@selection.date}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'Sélection n° #{@selection.id} du #{@selection.date}.', template: 'layouts/pdf.html.erb', layout: 'pdf.html', page_size: 'A4', background: false, no_background: true, lowquality: true, zoom: 1, dpi: 300, encoding:"UTF-8")
    )
    # mail(to: todo.owner.email, subject: 'Your todo PDF is attached', todo: todo)
    mail(
      to:       @selection.fournisseur.email,
      bcc:      'bonjour@grainedemomes.com',
      subject:  "Votre dépôt chez Graîne de mômes"
    )
  end

  def devis(cart)
    @cart = cart
    attachments["Devis_G2M.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'devis_g2m.', template: 'layouts/pdf4.html.erb', layout: 'pdf4.html', page_size: 'A4', background: false, no_background: true, lowquality: true, zoom: 1, dpi: 300, encoding:"UTF-8")
    )
    # mail(to: todo.owner.email, subject: 'Your todo PDF is attached', todo: todo)
    mail(
      to:       @cart.user.email,
      bcc:      'bonjour@grainedemomes.com',
      subject:  "G2M - suite à votre devis"
    )
  end

  def information(selection)
    @selection = selection
    mail(
      to:       @selection.fournisseur.email,
      subject:  "Votre dépôt chez Graîne de mômes"
    )
  end

  def summary(selection)
    @selection = selection
    attachments["Sélection n° #{@selection.id} du #{@selection.date}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'Sélection n° #{@selection.id} du #{@selection.date}.', template: 'layouts/pdf.html.erb', layout: 'pdf3.html', page_size: 'A4', background: false, no_background: true, lowquality: true, zoom: 1, dpi: 300, encoding:"UTF-8")
    )
    # mail(to: todo.owner.email, subject: 'Your todo PDF is attached', todo: todo)
    mail(
      to:       @selection.fournisseur.email,
      bcc:      'bonjour@grainedemomes.com',
      subject:  "Graîne de mômes - situation de votre dépôt au #{Date.today.strftime("%d/%m/%Y")}"
    )
  end

  def generatecsv(csv)
    attachments['import_products.csv'] = {mime_type: 'text/csv', content: csv}
    mail(to: 'bonjour@grainedemomes.com', subject: 'Nouveau CSV pour Shopify')
  end

  def fournisseurcsv(csv)
    attachments['fournisseur.csv'] = {mime_type: 'text/csv', content: csv}
    mail(to: 'bonjour@grainedemomes.com', subject: 'Sauvegarde des fournissseurs')
  end

  def paiement(paiement)
    @paiement = paiement
    mail(to: 'marine@grainedemomes.com', subject: 'Nouvelle demande de paiement')
  end

  def avoir(paiement)
    @paiement = paiement
    mail(to: 'marine@grainedemomes.com', subject: 'Nouvel avoir généré')
  end

end
