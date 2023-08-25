class DeleterequestsController < ActionController::Base
  # GET /deleterequests/new
  def new
    @deleterequest = Deleterequest.new
  end


  # POST /deleterequests
  def create
    @deleterequest = Deleterequest.new(deleterequest_params)

    if @deleterequest.save
      redirect_to @deleterequest, notice: 'Deleterequest was successfully created.'
    else
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def deleterequest_params
      params.require(:deleterequest).permit(:username, :comments)
    end
end
