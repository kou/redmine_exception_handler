class ExampleExceptionController < ApplicationController
  def index
    raise Exception, 'Example exception'
  end
end
