class Img

  def initialize (pic)
    @pic = pic
  end

  def get_ones
    ones = []
    @pic.each.with_index do |row, row_number|
      row.each.with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def blur!(blur_distance)
    ones = get_ones
      

    @pic.each.with_index do |row, row_number|
      row.each.with_index do |item, col_number|
        ones.each do |found_row_number, found_col_number|
          if manhattan_distance(col_number, row_number, found_col_number, found_row_number) <= blur_distance
            @pic[row_number][col_number] = 1
          end
        end
      end
    end
  end

  #Blur 2
  # if row_number == found_row_number && col_number == found_col_number
  #   @pic[row_number -1][col_number] = 1 unless row_number == 0 
  #   @pic[row_number +1][col_number] = 1 unless row_number >= 3 
  #   @pic[row_number][col_number -1] = 1 unless col_number == 0 
  #   @pic[row_number][col_number +1] = 1 unless col_number >= 3 
         
  def manhattan_distance (x1, y1, x2, y2)
      horizontal_distance = (x2 - x1).abs
      vertical_distance = (y2 - y1).abs
      # (x2 - x1).abs + (y2 - y1).abs
      horizontal_distance + vertical_distance
  end

  def output_image
    @pic.each do |data|
      puts data.join
    end
  end
end

img = Img.new([
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 1, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1],
])

# img = Img.new([
# [0, 0, 0, 0],
# [0, 1, 0, 0],
# [0, 0, 0, 1],
# [0, 0, 0, 0]
# ])

# original 
img.output_image
puts
img.blur!(3)

# blurred 
img.output_image