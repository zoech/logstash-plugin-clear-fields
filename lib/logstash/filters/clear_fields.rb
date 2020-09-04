# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

# This  filter will replace the contents of the default 
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an .
class LogStash::Filters::ClearFields < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #    {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "clear_fields"
  
  # config
  config :remain_fields, :validate => :array, :default => ["@timestamp", "[@timestamp]"]
  

  public
  def register
    # Add instance variables 
  end # def register

  public
  def filter(event)

    if @message
      # Replace the event message with our message as configured in the
      # config file.
      event.set("message", @message)


    end

    origin_fields = event.to_hash.keys.map { |k| "[#{k}]" }
    origin_fields.each do |ori_f|
      remove_field(event, ori_f, @remain_fields)
    end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter


  def remove_field(event, ff, remains)
    val = event.get(ff)
    if val.is_a?(Hash) || val.is_a?(java.util.Map)
      val.keys.each do |key|
        remove_field(event, "#{ff}[#{key}]", remains)
      end
    else
      if not remains.include?(ff)
        event.remove(ff)
      end
    end

  end
end # class LogStash::Filters::ClearFields
