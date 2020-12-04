class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @fournisseurs = Fournisseur.all
    @selections = Selection.all
    @products = Product.all
  end

  def stat
    @fournisseurs = Fournisseur.all
    @selections = Selection.all
    @products = Product.all
  end
end
