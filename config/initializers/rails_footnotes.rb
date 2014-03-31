if Rails.env.development?
  Footnotes.setup do |f|
    f.enabled = true
    f.lock_top_right = true
    f.font_size = '16px'
  end
end
