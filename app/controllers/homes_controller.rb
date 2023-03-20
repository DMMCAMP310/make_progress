class HomesController < ApplicationController
  def top
    @reports = Report.order("id DESC").limit(4)
  end
end
