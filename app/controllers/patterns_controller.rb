class PatternsController < ApplicationController

  def show
    @pattern = Pattern.friendly.find(params[:id])
    @all_patterns = Pattern.all.order("company ASC")
  end

  def index
    @patterns = Pattern.all.order("company ASC")
  end

end
