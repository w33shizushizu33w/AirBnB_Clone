module UsersHelper
    def gravatar_for(user, options = { size: 50 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=https://frame-illust.com/fi/wp-content/uploads/2018/03/niwatori-06.png?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar", width: 80, height:80)
      end
    
end
