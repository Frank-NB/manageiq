class ApplicationHelper::Button::GenericFeatureButtonWithDisable < ApplicationHelper::Button::GenericFeatureButton
  needs_record

  def calculate_properties
    self[:enabled] = !(self[:title] = @error_message if disabled?)
  end

  def disabled?
<<<<<<< HEAD
    !!(@error_message = @record.is_available_now_error_message(@feature))
=======
    begin
      begin
        @error_message = @record.try(:unsupported_reason, @feature)
      rescue NoMethodError
        @error_message = @record.try(:is_available_now_error_message, @feature) if @error_message.nil?
      end
    rescue
      @error_message = 'Feature is not supported.'
      true
    end
>>>>>>> 407f786... fixup
  end
end
