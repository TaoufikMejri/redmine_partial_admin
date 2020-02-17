module RedminePartialAdmin
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_users_form, :partial => 'users/hooks/view_users_form'
  end
end