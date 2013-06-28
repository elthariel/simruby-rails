##
## hash_tags_spec.rb
## Login : <lta@still>
## Started on  Tue Jun 25 17:31:41 2013 Lta Akr
## $Id$
##
## Author(s):
##  - Lta Akr <>
##
## Copyright (C) 2013 Lta Akr

require 'spec_helper'

feature 'Gazooy::HashTags' do
  include_context 'authenticated'
  given!(:gazooy) { Gazooy.create! user_id: user.id, text: 'This is a #simple #gazooy on my #ruby twitter' }

  it 'detects #hashtags in gazooies and link to them' do
    tags = gazooy.hash_tags.map &:name

    tags.include?('simple')
    tags.include?('gazooy')
    tags.include?('ruby')
    HashTag.find_by(name: 'simple').should be_a(HashTag)
  end

  it 'displays all the gazooies having some #hastag' do
    Gazooy.create! user_id: user.id, text: 'This is another #gazooy on my #ruby twitter'

    visit hash_tag_path('ruby')
    within('.gazooies-block') do
      page.should have_content 'This is a #simple #gazooy'
      page.should have_content 'This is another #gazooy'
    end

    visit hash_tag_path('simple')
    within('.gazooies-block') do
      page.should have_content 'This is a #simple #gazooy'
      page.should have_no_content 'This is another #gazooy'
    end
  end

  it 'transform the #hashtag in the gazooy message to a link' do
    visit gazooies_path

    within('.gazooy-block') do
      page.should have_link('#simple')
      page.should have_link('#gazooy')
      page.should have_link('#ruby')
    end
  end

  it 'displays 10 most popular #hashtags (\'trends\') on the sidebar' do
    (0..15).each do |i|
      (0..i).each do |j|
        Gazooy.create!(user_id: user.id, text: "#ht#{i} gazooy number #{j}")
      end
    end

    visit root_path
    within('.trends') do
      page.should have_content 'Tendances'
      page.should have_no_content '#ht0'
      page.should have_no_content '#ht3'
      page.should have_content '#ht10'
      page.should have_content '#ht13'
    end

    click_on '#ht13' # Leads to /hash_tags/ht13
    page.should have_content '#ht13 gazooy number 0'
    page.should have_content '#ht13 gazooy number 7'
    page.should have_content '#ht13 gazooy number 13'
    page.should have_no_content '#ht12 gazooy number 0'
    page.should have_no_content '#ht0 gazooy number 0'
  end
end
