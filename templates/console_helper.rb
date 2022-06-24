require "active_support/concern"

module ConsoleHelper
  extend ActiveSupport::Concern

  included do
    puts "\n《welcome to pedro》\n\n"
  end

end