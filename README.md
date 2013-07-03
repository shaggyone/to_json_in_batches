# ToJsonInBatches

Original task is in Russian

Нужно написать gem, который будет при генерации json большого объема, постепенно пушить сгенерированные куски в stream.
Например если нужно выбрать из базы 1 млн объектов и в json их отдать, код будет таким:

  Product.where("...").to_json

Это отъедает огромное количество памяти и времени. Вместо этого библиотека должна доставать из базы json кусками и кусками же его отдавала в поток:

  Product.where("...").to_json_in_batches

Внутри:

  Product.where("...").find_each do
  # respond with batch in json
  end

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

