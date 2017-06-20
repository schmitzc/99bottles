class Bottles
  BOTTLE =  'bottle'
  NO_BOTTLES_VERSE = 'Go to the store and buy some more, 99 bottles of beer on the wall.'

  def verse(num)
    current_bottles = pluralize(BOTTLE, num)

    <<~VERSE
    #{current_bottles.capitalize} of beer on the wall, #{current_bottles} of beer.
    #{second_verse(num)}
    VERSE
  end

  def verses(start, finish)
    (finish..start).to_a.reverse.map { |num| verse(num) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def pluralize(string, num)
    pluralized = "#{colloquial_num(num)} #{string}"
    pluralized += 's' unless num == 1
    pluralized
  end

  def colloquial_num(num)
    return 'no more' if num.zero?
    num
  end

  def take_down_phrase(num)
    noun = num == 1 ? 'it' : 'one'
    "Take #{noun} down"
  end

  def second_verse(num)
    return NO_BOTTLES_VERSE if num.zero?

    next_bottles = pluralize(BOTTLE, num - 1)
    "#{take_down_phrase(num)} and pass it around, #{next_bottles} of beer on the wall."
  end
end
