require_dependency 'application_controller'

module RedminePartialAdminPatch
  module ApplicationControllerPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method :require_admin_without_partial_admin, :require_admin
        alias_method :require_admin, :require_admin_with_partial_admin
      end
    end

    module InstanceMethods
      def require_admin_with_partial_admin
        return unless require_login
        if !User.current.admin? && !User.current.partial_admin?
          render_403
          return false
        end
        true
      end
    end
  end
end

ApplicationController.send(:include, RedminePartialAdminPatch::ApplicationControllerPatch)

