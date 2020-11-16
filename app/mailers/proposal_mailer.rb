class ProposalMailer < ApplicationMailer

# Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gift_mailer.confirmation.subject
  #
  def information(selection)
    @selection = selection
    attachments["Récapitulatif de la sélection No. #{@selection.id} du #{@selection.date}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'todo', template: 'todo.pdf.erb', layout: 'pdf.html'), { :hash_with_wickedpdf_options }
    )
    mail(
      to:       @selection.fournisseur.email,
      subject:  "Votre dépôt chez Graîne de mômes"
    )
  end

  # def pdf_attachment_method(todo_id)
  #   todo = Todo.find(todo_id)
  #   attachments["todo_#{todo.id}.pdf"] = WickedPdf.new.pdf_from_string(
  #     render_to_string(pdf: 'todo', template: 'todo.pdf.erb', layout: 'pdf.html'), { :hash_with_wickedpdf_options }
  #   )
  #   mail(to: todo.owner.email, subject: 'Your todo PDF is attached', todo: todo)
  # end
end
