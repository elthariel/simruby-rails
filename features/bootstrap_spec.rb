##
## bootstrap_spec.rb
## Login : <lta@still>
## Started on  Mon Jun 24 11:07:47 2013 Lta Akr
## $Id$
##
## Author(s):
##  - Lta Akr <>
##
## Copyright (C) 2013 Lta Akr

require 'spec_helper'

feature 'Twitter\'s Bootstrap CSS framework' do
  it 'provides a grid on the page' do
    visit root_path

    page.should have_css('.container')
    page.should have_css('.row')
    page.should have_css('.span3')     # Menu a gauche/droite
    page.should have_css('.span9')     # Main content
  end

  it 'provides some cool graphic graphic tricks' do
    visit root_path

    page.should have_css('.well')      # Utilise un well qq part, ca fait tjs clase
    page.should have_css('.hero-unit') # Utilise un Hero Unit sur la page d'accueil, c'est classe aussi
  end

  it 'provides a cool navbar' do
    visit root_path

    within '.navbar-fixed-top' do
      # Ici je verifie que tout les elements d'une navbar twitter bootstrap sont presents.
      page.should have_css('.container')
      page.should have_css('.navbar-inner')
      page.should have_css('a.brand')
      page.should have_css('ul.nav')
      page.should have_css('.pull-right')   # Ca c'est pratique pour tout ce qui touche au login.
    end
  end
end
