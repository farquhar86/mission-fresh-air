module SuperusersHelper

  def the_super_user
    @superuser ||= Superuser.find(1)
  end

end
