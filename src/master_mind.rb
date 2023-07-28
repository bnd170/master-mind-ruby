# frozen_string_literal: true

class MasterMind

  def initialize(secret)
    @secret = secret
    save_colors_count
  end

  def guess(code)
    find_and_order_placed_colours(code)
  end

  private

  def find_and_order_placed_colours(code)
    well_placed = miss_placed = 0
    code.split('').each_with_index do |letter, index|
      if letter == @secret[index]
        well_placed += 1
        @colors[letter] -= 1
      elsif @secret.include?(letter) && @colors[letter] > 0
        miss_placed += 1
      end
    end
    [well_placed, miss_placed]
  end

  def save_colors_count
    @colors = {}

    @secret.split('').each do |letter|
      @colors[letter] = @colors[letter] ? @colors[letter] + 1 : 1
    end
  end

end
