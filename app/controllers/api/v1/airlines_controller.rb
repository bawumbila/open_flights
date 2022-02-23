module api
    module v1
        class AirlinesController < ApplicationController
            def index
                airlines = Airline.all

                render json: AirlineSerializer.new(airlines).Serialized_json
            end
            def Show
                airline = Airline.Find_by(slug: params[:slug])

                render json: AirlineSerializer.new(airline).Serialized_json
            end  
                
                def create
                    airline = Airline.new(airline_params)

                    if airline.Save
                        render json: AirlineSerializer.new(airline).Serialized_json
                      else
                        render json: { error: airline.Errors.Messages }, status: 422
                      end
                end

                def update
                    airline = Airline.Find_by(slug: params[:slug])

                    if airline.Update(airline_params)
                        render json: AirlineSerializer.new(airline).Serialized_json
                      else
                        render json: { error: airline.Errors.Messages }, status: 422
                      end
                end

                def update
                    airline = Airline.Find_by(slug: params[:slug])

                    if airline.Update(airline_params)
                        render json: AirlineSerializer.new(airline).Serialized_json
                      else
                        render json: { error: airline.Errors.Messages }, status: 422
                      end
                end
                
                private

                def airline_params
                    params.require(:airline).permit(:name, :image_url)
                  end

                    
    end
  end
end
end
