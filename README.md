[![Gem Version](https://badge.fury.io/rb/acts_as_roleable.png)](http://badge.fury.io/rb/acts_as_roleable)
[![Build Status](https://travis-ci.org/elsom25/acts_as_roleable.png?branch=master)](https://travis-ci.org/elsom25/acts_as_roleable)
[![Code Climate](https://codeclimate.com/github/elsom25/acts_as_roleable.png)](https://codeclimate.com/github/elsom25/acts_as_roleable)
[![Coverage Status](https://coveralls.io/repos/elsom25/acts_as_roleable/badge.png)](https://coveralls.io/r/elsom25/acts_as_roleable)

# ActsAsRoleable

Adds role based authorization to Rails using the lovely [RoleModel](https://github.com/martinrehfeld/role_model) and the scopes of [Canard](https://github.com/james2m/canard). No Authorization, just roles.

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_roleable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_roleable

## Usage

Any model you want to support roles and handy role scopes for, add:

    acts_as_roleable roles: [:tester, :user, :owner]

And be sure to add a `roles_mask:integer` column to the associated table. You can change the name of this column by passing the `roles_mask` attribute:

    acts_as_roleable roles: [:tester, :user, :owner], roles_mask: :internal_mask

## Contributing

1. Fork it (`http://github.com/<my-github-username>/acts_as_roleable/fork`)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
