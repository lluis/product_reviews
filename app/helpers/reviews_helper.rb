module ReviewsHelper

  def pretty_rating(rating)
    stars = []
    5.times do |i|
      fa_class = i < rating ? "fa-solid" : "fa-regular"
      stars << content_tag(:i, nil, class: "#{fa_class} fa-star")
    end
    safe_join stars
  end

end
