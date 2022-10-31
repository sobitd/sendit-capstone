class ParcelsController < ApplicationController 
  #allow only admins to 
  # GET /parcels or /parcels.json
  def index
    @parcels = Parcel.all
    render json: @parcels, status: :ok
  end

  # GET /parcels/1 or /parcels/1.json
  def show
    @parcel = Parcel.find_by(id: params[:id])
    render json: @parcel, status: :ok
  end

  # POST /parcels or /parcels.json
  def create
    @parcel = Parcel.create(user_id: session[:user_id])
    render json: @parcel, status: :created
  end

  # PATCH/PUT /parcels/1 or /parcels/1.json
  def update
    @parcel = Parcel.create(user_id: session[:user_id])
    if @parcel
      @parcel.update(parcel_params)
      render json: @parcel
    else
      render json: { error: 'Parcel not found' }, status: :not_found
    end
  end

  # DELETE /parcels/1 or /parcels/1.json
  def destroy
    @parcel.destroy

    respond_to do |format|
      format.html { redirect_to parcels_url, notice: 'Parcel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def parcel_params
    params.require(:parcel).permit(:recipient_address, :recipient_name, :weight, :from, :destination,
                                   :recipient_contact, :user_id)
  end
end
