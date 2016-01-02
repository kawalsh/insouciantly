class Admin::RecommendationsController < ApplicationController
  http_basic_authenticate_with name: "kdubs", password: "ghbX!"
  layout "admin"

  def index
    @pending = Recommendation.where(status: "pending")
    @recs = Recommendation.where.not(status: "pending").order(updated_at: :desc)
  end

  def edit
    @rec = Recommendation.find(params[:id])
  end

  def update
    @rec = Recommendation.find(params[:id])
		respond_to do |format|
    	if @rec.update_attributes(recommendation_params)
    		format.html { redirect_to admin_recommendations_path }
    		format.xml  { head :ok }
    	else
    		format.html { render :action => "edit" }
    		format.xml  { render :xml => @rec.errors, :status => :unprocessable_entity }
    	end
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:title, :author, :recommender, :comment, :book_id, :status)
  end
end
