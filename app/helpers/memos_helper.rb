module MemosHelper

  def cover_image(memo, width = 240, height = 180)
    image_tag memo.cover_image.variant(resize: "#{width}x#{height}"), class: 'cover_image box' if memo.cover_image.attached?
  end

end
