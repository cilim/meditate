module Meditate
  class InlineValidationsController < ::ApplicationController

    def create
      object = validate_params[/^(.*?)\?/].to_s.gsub('?', '').try(:capitalize).try(:constantize)
      object_name = object.name.to_s.downcase
      field = validate_params[/\?(.*?)\=/].to_s.gsub('?', '').gsub('=', '').gsub("#{object_name}_", '')
      value = validate_params[/\=.+/].to_s.sub('=', '')
      parameters = {}
      parameters[field] = value
      instance = object.new(parameters)
      instance.valid?
      response = !instance.errors.include?(field.to_sym)
      respond_to do |format|
        format.json { render json: {object: object_name, field_name: field, valid: response} }
      end
    end

    private
    def validate_params
      params.require(:object)
    end

  end
end