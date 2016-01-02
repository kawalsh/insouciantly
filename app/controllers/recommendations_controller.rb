class RecommendationsController < ApplicationController

  def index
    @recs = Recommendation.where.not(status: "pending", book_id: nil).order(updated_at: :desc)
  end

  def new
    @latest_rec = Recommendation.where.not(status: "pending", book_id: nil).order(updated_at: :desc).take
		@rec = Recommendation.new
		respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rec }
    end
	end

	def create
		@rec = Recommendation.new(recommendation_params)
    respond_to do |format|
	    if @rec.save
	      format.html { redirect_to recommendations_url }
	      format.xml  { render :xml => @rec, :status => :created, :location => @rec}
	    else
	      format.html { render :action => "new" }
	      format.xml  { render :xml => @rec.errors, :status => :unprocessable_entity }
	  	end
  	end
	end

  private

	def recommendation_params
	  params.require(:recommendation).permit(:title, :author, :recommender, :comment)
	end
end
