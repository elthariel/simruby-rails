##
## has_image.rb
## Login : <lta@still>
## Started on  Mon Jun 24 20:26:56 2013 Lta Akr
## $Id$
##
## Author(s):
##  - Lta Akr <>
##
## Copyright (C) 2013 Lta Akr

module Capybara
  module Node
    class Element
      def has_image?(src)
        has_xpath?("//img[contains(@src,\"#{src}\")]")
      end
    end
  end
end
