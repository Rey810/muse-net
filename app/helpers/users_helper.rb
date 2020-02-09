module UsersHelper
    def id_user(user)
        user.name.downcase.tr(" ", "_")
    end
    
    def pluralizer(count, string)
      "#{count} #{string.pluralize(count)}"
    end

end
