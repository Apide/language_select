# -*- coding: utf-8 -*-
# Copyright (c) 2014 Apide ApS; all rights reserved

module LanguageSelect

  LANGUAGES =  {
    "ab" => "Abkhaz",
    "ar" => "Arabic",
    "be" => "Belarusian",
    "bs" => "Bosnian",
    "bg" => "Bulgarian",
    "da" => "Danish",
    "el" => "Greek",
    "en" => "English",
    "es" => "Spanish",
    "et" => "Estonian",
    "fa" => "Persian (Farsi)",
    "fi" => "Finnish",
    "fr" => "French",
    "ga" => "Irish",
    "he" => "Hebrew",
    "hi" => "Hindi",
    "hr" => "Croatian",
    "hu" => "Hungarian",
    "hy" => "Armenian",
    "id" => "Indonesian",
    "is" => "Icelandic",
    "it" => "Italian",
    "ja" => "Japanese",
    "ko" => "Korean",
    "ku" => "Kurdish",
    "lo" => "Lao",
    "lt" => "Lithuanian",
    "lv" => "Latvian",
    "mk" => "Macedonian",
    "ms" => "Malay",
    "nl" => "Dutch",
    "no" => "Norwegian",
    "pa" => "Panjabi",
    "pl" => "Polish",
    "ps" => "Pashto",
    "pt" => "Portuguese",
    "ro" => "Romanian",
    "ru" => "Russian",
    "se" => "Swedish",
    "sk" => "Slovak",
    "sl" => "Slovene",
    "sr" => "Serbian",
    "sq" => "Albanian",
    "th" => "Thai",
    "tr" => "Turkish",
    "uk" => "Ukranian",
    "ur" => "Urdu",
    "vi" => "Vietnamese",
    "zh" => "Chinese",
    "zu" => "Zulu"
  } unless const_defined?("LANGUAGES")

  LANGUAGES_FOR_SELECT = LANGUAGES.invert.sort unless const_defined?("LANGUAGES_FOR_SELECT")

end
