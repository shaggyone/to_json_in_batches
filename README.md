# ToJsonInBatches

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'to_json_in_batches'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_json_in_batches

## Usage

    Post.where(...).to_json_in_batches(stream, as_json_options, batch_options)

stream - output stream to receive data

as_json_options - argument to be bassed to ActiveRecord#as_json

batch_options - options to be passed to ActiveRecord#find_in_batches

