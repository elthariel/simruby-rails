##
## gazooy_simple_spec.rb
## Login : <lta@still>
## Started on  Mon Jun 24 19:33:42 2013 Lta Akr
## $Id$
##
## Author(s):
##  - Lta Akr <>
##
## Copyright (C) 2013 Lta Akr

# This file contains the first features spec series for the actual
# Gazooies (plural of Gazooy)


require 'spec_helper'

feature 'Gazooy Simple' do
  include_context 'authenticated'

  given!(:gazooies) do
    [Gazooy.create!(user_id: user.id, text: 'Je suis un gazooy de test'),
    Gazooy.create!(user_id: user.id, text: 'Je suis un 2e gazooy de test')]
  end

  describe 'Show | Index' do
    it 'displays latest gazooies on the left menu' do
      visit root_path

      page.should have_content gazooies[0].text
      page.should have_content gazooies[1].text
    end

    it 'displays a \'Stream\' link in the navbar to go to gazooies#index' do
      visit root_path

      within('.navbar-inner') do
        click_on 'Stream'
      end

      current_path.should == gazooies_path
    end

    it 'displays latest gazooies on gazooies#index' do
      visit gazooies_path

      within('.gazooies-block') do
        page.should have_content gazooies[0].text
        page.should have_content gazooies[1].text
      end
    end

    it 'displays most recent gazooies first' do
      visit gazooies_path

      block = find('.gazooies-block')
      block.text.should =~ /#{gazooies[1].text}.+#{gazooies[0].text}/
    end

    it 'displays the avatar of the post profile near the gazooy' do
      visit gazooies_path

      block = find('.gazooy-block:nth-of-type(1)')
      block.should have_selector('img.avatar')
      block.should have_image(user.profile.avatar.thumb.url)
    end

    it 'allows to click on the avatar to visit the profile of the gazooyr' do
      visit gazooies_path

      within('.gazooy-block:nth-of-type(1)') do
        img = find('img.avatar')
        img.trigger 'click'
      end

      current_path.should == profile_path(user.profile)
    end
  end

  describe 'Create' do
    scenario 'There\'s a link in the navbar' do
      visit root_path

      within('.navbar-inner') do
        page.should have_link 'Gazooyer'
      end
    end

    it 'opens a modal form when you click on \'Gazooyer\'', js: true do
      visit root_path
      within('.navbar-inner') do
        click_on 'Gazooyer'
      end

      within('.modal-header') { page.should have_content 'Gazooyez!' }
      within('.modal-body') { page.should have_field 'gazooy[text]' }
      within('.modal-footer') { page.should have_button 'Envoyer !' }
    end

    it 'creates Gazooy when filling and submitting the form', js: true do
      gz = "Ca gazooy sec !"

      visit root_path
      within('.navbar-inner') do
        click_on 'Gazooyer'
      end

      within('#new_gazooy') do
        fill_in 'gazooy[text]', with: gz
        click_on 'Envoyer !'
      end

      # visit root_path
      # page.should have_content gz
      # visit gazooies_path
      # page.should have_content gz
    end



  end



end