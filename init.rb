require 'redmine'
require 'redmine_partial_admin/user_patch'
require 'redmine_partial_admin/application_controller_patch'


require_dependency 'redmine_partial_admin/hooks'

Redmine::Plugin.register :redmine_partial_admin do
  name 'Redmine Partial Admin plugin'
  author 'Author name'
  description 'This is a plugin for Redmine to access simple user to partial admin activities'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  menu :top_menu, :administration2, { :controller => 'admin', :action => 'index' }, :if => Proc.new { User.current.partial_admin? }, caption: 'Admininstration'
end

module Redmine
  module MenuManager
    module MenuHelper
      def render_menu(menu, project=nil)
        if menu == :admin_menu
          links = []
          menu_items_for(menu, project) do |node|
            if User.current.partial_admin?
              access = User.current.access
              links << render_menu_node(node, project) if access.include? node.name.to_s
            else
              links << render_menu_node(node, project)
            end
          end
          links.empty? ? nil : content_tag('ul', links.join.html_safe)
        else
          links = []
          menu_items_for(menu, project) do |node|
            links << render_menu_node(node, project)
          end
          links.empty? ? nil : content_tag('ul', links.join.html_safe)
        end

      end
    end
  end
end
