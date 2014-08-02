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

### So how do I use this?

Well, let's start with a simple User class with roles:

    class User < ActiveRecord::Base
      extend ActsAsRoleable::Roleatize

      acts_as_roleable roles: [:tester, :standard, :admin]
    end

Now, you have a few different things you can try out.

You can see if a user is of certain types:

    user = User.new(roles: :tester)
    user.tester?            # => true
    user.standard?          # => false
    user.admin?             # => false

    # or the alternative syntax
    user.has_role? :tester  # => true

But why stop there?

    user = User.new(roles: [:tester, :admin])
    user.tester?    # => true
    user.standard?  # => false
    user.admin?     # => true

    user.has_any_role? :tester, :standard   # => true
    user.has_all_roles? :tester, :standard  # => false

That's all great, but why am I including a gem for a few bool checks? Well, let's show off the *real* magic.

    # lets assume that we have *lots* of users in our User model
    User.admins       # => returns all Users that have the :admin role
    User.non_admins   # => returns all Users that *do not* have the :admin role

    User.with_any_role :admin, :tester    # => returns all users that have either :admin OR :tester
    User.with_all_roles :admin, :tester   # => returns all users that have both :admin AND :tester

### How do I use this with Rails?

Just like above, let's say we have a User model that you want to add roles to. Just use the extend `ActsAsRoleable::Roleatize` method, and then use the `acts_as_roleable` method. Example below:

    class User < ActiveRecord::Base
      extend ActsAsRoleable::Roleatize

      acts_as_roleable roles: [:tester, :standard, :owner]
    end

And be sure to add a `roles_mask:integer` column to the associated table. You can change the name of this column by passing the `roles_mask` attribute:

    acts_as_roleable roles: [:tester, :standard, :owner], roles_mask: :my_fancy_roles_mask

BE WARNED: the roles are stored internally as a bitmask, so its based on **order** of the roles, not the **name**. This means it's super easy to rename roles, but don't go changing the order around (it doesn't mean anything anyways, so nothing to worry about!)

### What if I don't use Rails but want to use acts\_as\_roleable?

Unfortunately, too bad for you ):

This gem is only useful if you have an `active_record` backing, since it's primary purpose is to add handy scopes to your model. If you want *just* roles, why not check out [RoleModel](https://github.com/martinrehfeld/role_model), which is what backs the roles in ActsAsRoleable!

## Contributing

1. Fork it (`http://github.com/<my-github-username>/acts_as_roleable/fork`)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
