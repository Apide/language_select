# -*- coding: utf-8 -*-
# Copyright (c) 2014 Apide ApS; all rights reserved

require 'spec_helper'

require 'action_view'
require 'language_select'

module ActionView

  module Helpers

    describe LanguageSelect do
      include TagHelper

      class Walrus
        attr_accessor :language
      end

      let(:walrus) { Walrus.new }

      let!(:template) { ActionView::Base.new }

      let(:select_tag) do
        '<select id="walrus_language" name="walrus[language]">'
      end

      let(:selected_en_option) do
        if defined?(Tags::Base)
          content_tag(:option, 'English', :selected => :selected, :value => 'en')
        else
          '<option value="en" selected="selected">English</option>'
        end
      end

      let(:builder) do
        if defined?(Tags::Base)
          FormBuilder.new(:walrus, walrus, template, {})
        else
          FormBuilder.new(:walrus, walrus, template, {}, Proc.new { })
        end
      end

      describe "#language_select" do
        let(:tag) { builder.language_select(:language) }
        it "creates a select tag" do
          tag.should include(select_tag)
        end
        
        it "creates option for each language" do
          ::LanguageSelect::LANGUAGES.each do |code, name|
            tag.should include(content_tag(:option, name, :value => code))
          end
        end

        it "selects the value of language" do
          walrus.language = 'en'
          t = builder.language_select(:language)
          t.should include(selected_en_option)
        end
      end # language_select

      describe "#priority_languages" do
        let(:tag) { builder.language_select(:language, ['en']) }

        it "puts the priority languages at the top" do
          tag.should include("#{select_tag}<option value=\"en")
        end

        it "inserts a divider" do
          tag.should include('>English</option><option value="" disabled="disabled">-------------</option>')
        end

        it "does not mark two languages as selected" do
          walrus.language = "en"
          str = <<-EOS.strip
              </option>\n<option value="en" selected="selected">English</option>
            EOS
          tag.should_not include(str)
        end
      end #proprity_languages

    end #LanguageSelect

  end

end
