class Admin::PartiesController < Admin::BaseController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  # GET /admin/parties
  # GET /admin/parties.json
  def index
    @parties = Party.all
  end

  # GET /admin/parties/1
  # GET /admin/parties/1.json
  def show
  end

  # GET /admin/parties/new
  def new
    @party = Party.new
  end

  # GET /admin/parties/1/edit
  def edit
  end

  # POST /admin/parties
  # POST /admin/parties.json
  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to [:admin, @party], notice: 'Party was successfully created.' }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/parties/1
  # PATCH/PUT /admin/parties/1.json
  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to [:admin, @party], notice: 'Party was successfully updated.' }
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/parties/1
  # DELETE /admin/parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to admin_parties_url, notice: 'Party was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:name, :image)
    end
end
