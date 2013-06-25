# -*- coding: utf-8 -*-
##
## devise_spec.rb
## Login : <lta@still>
## Started on  Sat Jun 22 17:54:35 2013 Lta Akr
## $Id$
##
## Author(s):
##  - Lta Akr <>
##
## Copyright (C) 2013 Lta Akr

require 'spec_helper'

feature 'Authentication with Devise' do
  given! :user do
    User.create(email: 'test@example.com', username: 'test',
                password: 'qweasd', password_confirmation: 'qweasd')
  end


  describe 'SignUp' do
    it 'has a SignUp form' do
      visit new_user_registration_path

      page.should have_selector('#user_username')
      page.should have_selector('#user_email')
      page.should have_selector('#user_password')
      page.should have_selector('#user_password_confirmation')
    end

    it 'actually allows to signup' do
      visit new_user_registration_path

      within('#new_user') do
        fill_in 'user[username]',              with: 'test123'
        fill_in 'user[email]',                 with: 'test123@example.com'
        fill_in 'user[password]',              with: 'qweasd'
        fill_in 'user[password_confirmation]', with: 'qweasd'
        click_on "S'enregistrer"
      end

      page.should have_content 'Bienvenue !'
    end

    it 'validates email' do
      visit new_user_registration_path

      within('#new_user') do
        fill_in 'user[username]',              with: 'test123'
        fill_in 'user[email]',                 with: 'test123'
        fill_in 'user[password]',              with: 'qweasd'
        fill_in 'user[password_confirmation]', with: 'qweasd'
        click_on "S'enregistrer"
      end

      page.should have_content 'Adresse email invalide'
    end

    it 'validates password confirmation' do
      visit new_user_registration_path

      within('#new_user') do
        fill_in 'user[username]',              with: 'test123'
        fill_in 'user[email]',                 with: 'test123@example.fr'
        fill_in 'user[password]',              with: 'qweasd'
        fill_in 'user[password_confirmation]', with: 'qweasdERROR'
        click_on "S'enregistrer"
      end

      page.should have_content 'differente'
    end
  end


  describe 'Signin' do
    it 'allows connection' do
      visit new_user_session_path

      within('#new_user') do
        fill_in 'user[username]', with: user.username
        fill_in 'user[password]', with: user.password
        check 'user[remember_me]'

        click_on('Sign in')
      end

      expect(page).to have_content 'Connecté'
      expect(page).to have_content :all, 'Mon Compte'
    end
  end

  describe 'SignOut' do
    include_context 'authenticated'
    it 'allows disconnection' do
      visit('/')

      click_on 'logout' # Your LogOut button/link must have the id #logout

      expect(page).to have_content 'Déconnecté'
      expect(page).to have_no_content :all, 'Mon Compte'
      expect(page).to have_no_content 'Moi'
    end
  end

  describe 'Account edition' do
    include_context 'authenticated'

    it 'has a link in a dropdown in the navbar', js: true do
      visit root_path

      within('.navbar') do
        click_on 'account-dropdown' # Bootstrap's %a.dropdown-toggle must have id #account-dropdown
        click_on 'Mon Compte'
      end
      current_path.should == edit_user_registration_path
    end

    it 'allows change of email, pass and username' do
      visit edit_user_registration_path

      within '#edit_user' do
        fill_in 'user[username]',                 with: 'test_new'
        fill_in 'user[email]',                    with: 'new@email.com'
        fill_in 'user[password]',                 with: 'newpassword'
        fill_in 'user[password_confirmation]',    with: 'newpassword'
        fill_in 'user[current_password]',         with: user.password
        click_on 'Mettre à jour'
      end

      expect(page).to have_content 'Votre compte a été modifié avec succès'
      User.find_by(username: 'test_new').should be_true
      User.find_by(email: 'new@email.com').should be_true
    end

    it 'allows to quit !' do
      visit edit_user_registration_path

      User.find_by(username: user.username).should be_true
      click_on 'Quitter Gazooyr'
      User.find_by(username: user.username).should be_nil
    end
  end
end
