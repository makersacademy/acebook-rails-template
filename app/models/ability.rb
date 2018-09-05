class Ability
  include CanCan::Ability
 
  def initialize(user)
    # Define abilities for the passed in user here. For example:
 
    user ||= User.new # guest user (not logged in)
    if user.superadmin_role?
          can :manage, :all
          can :access, :rails_admin       # only allow admin users to access Rails Admin
          can :dashboard                  # allow access to dashboard
    end
    if user.supervisor_role?
          can :manage, User
    end
    if user.user_role?
      can :manage, :all, user_id: user.id
    end
    
  end
end
