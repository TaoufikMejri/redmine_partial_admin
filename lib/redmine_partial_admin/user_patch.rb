require_dependency 'user'

module RedminePartialAdminPatch
  module UserPatch
    def self.included(base)
      base.class_eval do
        serialize :access
        safe_attributes 'partial_admin',
                        'access'
      end
    end
  end
end

User.send(:include, RedminePartialAdminPatch::UserPatch)

