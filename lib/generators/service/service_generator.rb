# frozen_string_literal: true

class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def generate_files
    template "service.rb.tt", service_path
    template "contract.rb.tt", contract_path
  end

  private

  def service_path
    File.join("app/services", class_path, "#{file_name}.rb")
  end

  def contract_path
    File.join("app/contracts", class_path, "#{file_name}_contract.rb")
  end

  def module_names
    class_path.map(&:camelize)
  end

  def demodulized_class_name
    class_name.demodulize
  end

  def contract_class_name
    "#{demodulized_class_name}Contract"
  end
end
