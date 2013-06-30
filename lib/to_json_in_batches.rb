require "to_json_in_batches/version"
require 'pry'
module ToJsonInBatches
  extend ActiveSupport::Concern

  def to_json_in_batches stream, as_json_options = {}, batch_options = {}
    batch_options = batch_options.dup
    batch_options.reverse_merge! batch_size: 1000

    stream << "["
    any_data_added = false
    find_in_batches batch_options do |group|
      stream << "," if any_data_added
      any_data_added ||= group.any?

      stream << group_to_json(group, as_json_options)
    end
    stream << "]"
  end

  def group_to_json group, as_json_options
    group.as_json(as_json_options).to_json[1..-2]
  end
end

ActiveRecord::Relation.class_eval do
  include ToJsonInBatches
end
