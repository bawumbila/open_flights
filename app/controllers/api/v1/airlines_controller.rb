module api
    module v1
        class AirlinesController < ApplicationController
            def index
                airlines = Airline.all

                render json: AirlineSerializer.new(airlines, options).serialized_json
            end
           

                def update
                    airline = Airline.Find_by(slug: params[:slug])

                    if airline.Update(airline_params)
                        render json: AirlineSerializer.new(airline, options).serialized_json
                      else
                        render json: { error: airline.errors.messages }, status: 422
                      end
                end

                def destroy
                    airline = Airline.Find_by(slug: params[:slug])

                    if airline.Destroy
                        head :no_content
                      else
                        render json: { error: airline.errors.messages }, status: 422
                      end
                end
                
                private

                def airline_params
                    params.require(:airline).permit(:name, :image_url)
                  end
                
                  def options
                    @options ||= { include: %i[reviews] }
                  end
                    
    end
  end
end
