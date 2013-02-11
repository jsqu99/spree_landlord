module Deface
  module Sources
=begin
    Template.class_eval do
      class << self
        include TemplateHelper
      end

      def self.execute(override)

        # which of these files, in this order or precedence, exists?

        tenant_source = nil

        if override.args[:tenant_name].present?
          tenantized_path = "tenants/#{override.args[:tenant_name]}/views/#{override.args[:template]}"
          begin
            tenant_source = load_template_source(tenantized_path, false)
          rescue ActionView::MissingTemplate
            # intentionally ignoring as we expect this to happen when there's no tenant-specific template
          end
        end

        if tenant_source.nil?
          load_template_source(override.args[:template], false)
        else
          tenant_source
        end
      end
    end
=end
  end
end
