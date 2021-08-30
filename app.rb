require "rubygems"
require "mini_magick"

image_one = MiniMagick::Image.open("./image_one.jpg")
image_second = MiniMagick::Image.open("./image_second.png")
image_third = MiniMagick::Image.open("./image_third.gif")

composite_image = image_one.composite(image_second) do |config|
  config.compose "Over"   # Specify synthesis method
  config.gravity "center" # reference point
  config.geometry "+0+0"  # Move from the reference point
end
composite_image = composite_image.composite(image_third) do |config|
  config.compose "Over"
  config.gravity "center"
  config.geometry "+0+0"
end

composite_image.format "png"
composite_image.write "output.png"
