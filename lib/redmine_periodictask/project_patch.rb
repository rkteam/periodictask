module RedminePeriodictask
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        has_many :periodictasks, :dependent => :destroy
      end
    end
  end
end

# rubocop:disable Style/IfUnlessModifier
unless Project.included_modules.include?(RedminePeriodictask::ProjectPatch)
  Project.send(:include, RedminePeriodictask::ProjectPatch)
end
# rubocop:enable Style/IfUnlessModifier