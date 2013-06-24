# -*- coding: utf-8 -*-
##
## news_spec.rb
## Login : <lta@still>
## Started on  Mon Jun 24 13:06:45 2013 Lta Akr
## $Id$
##
## Author(s):
##  - Lta Akr <>
##
## Copyright (C) 2013 Lta Akr

require 'spec_helper'

feature 'Actualites' do
  given!(:test_news) do
    content = "h1. HUGE news

Something big happened, blablahblah

h2. Some insights

Lorem ipsum dolorem sit amat et machinus trucus ressemblat a Lorem Ipsum

div(textile-text). Ze DiV"

    News.create!(title: 'Super News !', summary: 'Something big just happened bros', content: content)
  end

  describe 'Index | Show' do
    it 'displays an index with news' do
      visit news_index_path

      expect(page).to have_content test_news.title
      expect(page).to have_content test_news.summary
    end

    it 'displays the news correctly' do
      visit news_path(test_news)

      expect(page).to have_content  test_news.title
      expect(page).to have_content  test_news.summary
      expect(page).to have_content  'Lorem ipsum'
      expect(page).to have_selector 'div.textile-text'
    end
  end

  describe 'Creation | Edition' do
    include_context 'authenticated'

    it 'allows creation' do
      visit new_news_path

      content = '123456789012345678901234567890'

      within('#new_news') do
        fill_in 'news[title]',          with: 'Another Title'
        fill_in 'news[summary]',        with: 'great summary of ze nuz'
        fill_in 'news[content]',        with: content
        click_on 'Sauvegarder'
      end

      expect(page).to have_content  'Another Title'
      expect(page).to have_content  'great summary'
      expect(page).to have_content  '1234567890'

      visit news_index_path
      expect(page).to have_content  'Another Title'
      expect(page).to have_content  'great summary'
    end

    it 'allows edition' do
      visit edit_news_path(test_news)

      within('#edit_news_1') do
        fill_in 'news[title]',          with: 'Another Title'
        fill_in 'news[summary]',        with: 'great summary of ze nuz'
        click_on 'Sauvegarder'
      end

      expect(page).to have_content  'Another Title'
      expect(page).to have_content  'great summary'

      visit news_index_path
      expect(page).to have_content  'Another Title'
      expect(page).to have_content  'great summary'
    end

    it 'performs some validation' do
      visit new_news_path

      within('#new_news') do
        fill_in 'news[summary]',        with: '2'
        fill_in 'news[content]',        with: '3'
        click_on 'Sauvegarder'
      end

      expect(page).to have_content 'Titre ne peut pas etre vide'
      expect(page).to have_content 'Titre est trop court'
      expect(page).to have_content 'Contenu est trop court'
    end
  end

  describe 'Acces Rights' do
    it 'requires an authenticated User to create news' do
      visit new_news_path
      expect(page).to have_content 'Vous devez vous connecter'
      expect(page).to have_content 'Connection'
      expect(page).to have_selector '#new_user'
    end
    it 'requires an authenticated User to edit news' do
      visit edit_news_path(test_news)
      expect(page).to have_content 'Vous devez vous connecter'
      expect(page).to have_content 'Connection'
      expect(page).to have_selector '#new_user'
    end
    it 'only shows Comment form to authenticated users' do
      visit news_path(test_news)

      expect(page).to have_no_selector '#new_comment'
    end
  end

  describe 'Comments' do
    include_context 'authenticated'

    it 'allows posting comment from news#show' do
      visit news_path(test_news)

      within('#new_comment') do
        fill_in "comment[comment]", with: "Hey, Il est super cet article !"
        click_on 'Envoyer'
      end

      expect(page).to have_content '1 Commentaire(s)'
      expect(page).to have_content "Hey, Il est super cet article !"

      within('#new_comment') do
        fill_in "comment[comment]", with: "Ouais ... Euh ! Bof !"
        click_on 'Envoyer'
      end

      expect(page).to have_content '2 Commentaire(s)'
      expect(page).to have_content "Hey, Il est super cet article !"
      expect(page).to have_content "Ouais ... Euh ! Bof !"
    end
  end
end
