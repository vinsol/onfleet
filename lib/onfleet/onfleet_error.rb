module Onfleet
  class OnfleetError < StandardError
    attr_accessor :code, :name
  end
end