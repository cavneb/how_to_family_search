class Episode < ActiveRecord::Base

  def embed_code
    "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/#{self.youtube_id}\" frameborder=\"0\" allowfullscreen></iframe>".html_safe
  end

end
