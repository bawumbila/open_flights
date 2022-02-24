module api
    module v1
        class ReviewsController < ApplicationController

            private

            def create
                review = Review.new(review_params)

                if review.save
                    render json: Reviewserializer.new(review).serialized_json
                  else
                    render json: { error: review.errors.messages}, status: 422
                  end
                end

                def destroy
                    review = review.find(params[:id])

                    if review.destroy
                      head :no_content
                    else
                        render json: { error: review.errors.messages}, status: 422
                    end
                  end



                private

                def review_params
                    params.require(:review).permit(:title, :description, :score, :airline_id)
                  end
            
    end
  end
end