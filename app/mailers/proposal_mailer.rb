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
  end

end
