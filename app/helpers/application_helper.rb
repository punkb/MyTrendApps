module ApplicationHelper

	def hinted_text_field_tag(name, value = nil, hint = "Click and enter text", options={})
  value = value.nil? ? hint : value
  text_field_tag name, value, {:onclick => "if($(this).value == '#{hint}'){$(this).value = ''}", :onblur => "if($(this).value == ''){$(this).value = '#{hint}'}" }.update(options.stringify_keys)
end

def hinted_number_field_tag(name, value = nil)
  value = value.nil? ? hint : value
  text_field_tag name, value, {:onclick => "if($(this).value > 0){alert(ok)}"}
end

end
