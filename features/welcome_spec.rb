##
## welcome_spec.rb
## Login : <lta@still>
## Started on  Fri Jun 21 17:28:03 2013 Lta Akr
## $Id$
##
## Author(s):
##  - Lta Akr <>
##
## Copyright (C) 2013 Lta Akr

require 'spec_helper'

feature "Front Page" do
  it "sais Welcome !" do
    visit '/'
    expect(page).to have_content ("You're on Gazooyr !")
    expect(page).to have_content ("Le twitter qu'il est vachement plus mieux")
  end

  it "displays Trends" do
    visit '/'
    expect(page).to have_content ("Tendances")
  end

  it "displays Last Gazooies" do
    visit '/'
    expect(page).to have_content ("Les derniers gazooies")
  end

  it 'has a navbar' do
    visit '/'
    expect(page).to have_css('.navbar')
    expect(page).to have_css('ul.nav li a') # This is navbar links
    expect(find 'a.navbar-brand').to have_content('Gazooyr')
  end

end
