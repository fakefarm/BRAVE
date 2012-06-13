module UsersHelper

# pic=http://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?r=pg

    # Returns the Gravatar (http://gravatar.com/) for the given user.
    def gravatar_for(user)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end


  

end
