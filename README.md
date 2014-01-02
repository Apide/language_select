# Rails – Language Select
[![Build Status](https://travis-ci.org/apide/language_select.png?branch=master)](https://travis-ci.org/apide/language_select)

Provides a simple helper to get an HTML select list of languages using the
[ISO 639-1 standard](https://en.wikipedia.org/wiki/ISO_639-1).

Uses the two letter alpha codes to identify the language.

## Installation

Install as a gem using

```shell
gem install language_select
```
Or put the following in your Gemfile

```ruby
gem 'language_select'
```

## Example

Simple use supplying model and attribute as parameters:

```ruby
language_select("user", "language")
```

Supplying priority languages to be placed at the top of the list:

```ruby
language_select("user", "language", [ "English", "French", "German" ])
```

The language is stored using the ISO-639-1 two letter codes.

#### Getting the Language from ISO codes

```ruby
class User < ActiveRecord::Base

  def language_name
    ::LanguageSelect::LANGUAGES[language]
  end

end
```

## Tests

```shell
bundle
bundle exec rspec
```

### Running with multiple versions of actionpack

```shell
bundle exec appraisal
```

Copyright (c) 2013 Apide ApS, released under the MIT license
