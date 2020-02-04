module UsersHelper
    def id_user(user)
        user.name.downcase.tr(" ", "_")
    end
end
