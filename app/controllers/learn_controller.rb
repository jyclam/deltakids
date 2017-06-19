class LearnController < ApplicationController

  def surveys
    render json: { hello: 'surveys' }
  end


  def live
    render json: { hello: 'live_5_2_1_0' }
  end

end
