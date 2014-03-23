# SlimGruntHelpers

This gem injects a set of helpers in Ruby global namespace (or not, depending on
how you require the gem) which will help you when setting up a pipeline with
[Grunt](http://gruntjs.com/) and [Slim](https://github.com/slim-template/slim) template language.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slim-grunt-helpers', '~> 0.0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slim-grunt-helpers

## Usage

The easiest way is to just use bundler and so `Bundle.require(:default)`, which will inject code in
global namespace (notice that in any case every method is prefixed with **sg_**).  
Otherwise, if you don't want to pollute your global namespace you can change your Gemfile configuration into:

```ruby
gem 'slim-grunt-helpers', require: ['slim-grunt-helpers/helpers']
```

And you'll need to `include SlimGruntHelpers::Helpers` in some place to have methods available.

## Available helpers

Right now, only a few helpers are available, I'll add others in future.

#### sg\_enclose\_newline

Takes a `block` as an argument, just encloses the block in `\n#{ block }\n`

#### sg\_usemin\_css / sg\_usemin\_js

These two methods behave in the same way. The purpose is to use them with the very helpful
[grunt-usemin](https://github.com/yeoman/grunt-usemin) plugin which however requires some new lines here and
there which are boring to type directly in Slim. The usage is simple:

```ruby
== sg_usemin_css('application.css', alt: '.tmp') do |usemin|
  - usemin << 'styles/bootstrap.css'
  - usemin << 'styles/main.css', 'data-customattr' => 'customdata'
```

The first argument is required, and it's the `path` :

```html
<!-- build:<type>(alternate search path) <path> -->
```

The `:alt` argument is optional and it's the `alternate search path`.  
An object `usemin` will be yielded to the block which has only one method: **&lt;&lt;**.  
This method requires first argument which is path to your css file (http path) and the second argument is a
hash of options which are appended as attributes to the link tag. Notice that on `link` tag,
`rel="stylesheet"` is automatically appended (and can be overwritten by specifying a `rel` key in options).  
Additionally, notice that attributes with `nil` or `false` as value are not set (so you can remove `rel`), while those with `true` are set but without value and without `=""`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
