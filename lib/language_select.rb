# LanguageSelect
#
# Adds #language_select method to
# ActionView::FormBuilder
#
require 'language_select/version'
require 'language_select/languages'

module ActionView
  module Helpers
    module FormOptionsHelper
      #
      # Return select and option tags for the given object and method,
      # using language_options_for_select to generate the list of option tags.
      #
      def language_select(object, method, priority_languages = nil,
                                         options = {},
                                         html_options = {})

        tag = if defined?(ActionView::Helpers::InstanceTag) &&
                ActionView::Helpers::InstanceTag.instance_method(:initialize).arity != 0

                InstanceTag.new(object, method, self, options.delete(:object))
              else
                LanguageSelect.new(object, method, self, options)
              end

        tag.to_language_select_tag(priority_languages, options, html_options)
      end

      #
      # Returns a string of option tags for most languages throughout the World.
      #
      # You can also supply an array of languages as +priority_languages+. They
      # will be listed at the top of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call in
      # a regular HTML select tag.
      #
      def language_options_for_select(selected = nil, priority_languages = nil)
        language_options = "".html_safe

        if priority_languages then
          priority_languages_options = priority_languages.map do |code|
                                           [
                                             ::LanguageSelect::LANGUAGES[code],
                                             code
                                           ]
                                         end

          language_options += options_for_select(priority_languages_options, selected)
          language_options += '<option value="" disabled="disabled">-------------</option>\n'.html_safe
          #
          # prevents selected from being included
          # twice in the HTML which causes
          # some browsers to select the second
          # selected option (not priority)
          # which makes it harder to select an
          # alternative priority language
          #
          selected = nil if priority_languages.include?(selected)
        end

        return language_options + options_for_select(::LanguageSelect::LANGUAGES_FOR_SELECT, selected)
      end

    end

    module ToLanguageSelectTag
      def to_language_select_tag(priority_languages, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            language_options_for_select(value, priority_languages),
            options, value
          ), html_options
        )
      end
    end

    if defined?(ActionView::Helpers::InstanceTag) &&
        ActionView::Helpers::InstanceTag.instance_method(:initialize).arity != 0
      class InstanceTag
        include ToCountrySelectTag
      end
    else
      class LanguageSelect < Tags::Base
        include ToLanguageSelectTag
      end
    end

    class FormBuilder
      def language_select(method, priority_languages = nil,
                                 options = {},
                                 html_options = {})

        @template.language_select(@object_name, method, priority_languages,
                                                       options.merge(:object => @object),
                                                       html_options)
      end
    end
  end
end
