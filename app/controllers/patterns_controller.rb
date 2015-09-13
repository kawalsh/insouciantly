class PatternsController < ApplicationController

  def show
    @pattern = Pattern.find(params[:id])
    @all_patterns = Pattern.all.order("company ASC")
  end

end
