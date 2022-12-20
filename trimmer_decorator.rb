require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name unless @nameable.correct_name.size > 10
    stripped = @nameable.correct_name.strip
    if stripped.size > 10
      split_arr = @nameable.correct_name.chars
      split_arr.pop while split_arr.length > 10
      split_arr.join
    else
      stripped
    end
  end
end
