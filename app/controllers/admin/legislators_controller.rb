class Admin::LegislatorsController < ApplicationController
  before_action :set_admin_legislator, only: [:show, :edit, :update, :destroy]

  # GET /admin/legislators
  # GET /admin/legislators.json
  def index
    @admin_legislators = Legislator.all
  end

  # GET /admin/legislators/1
  # GET /admin/legislators/1.json
  def show
  end

  # GET /admin/legislators/new
  def new
    @admin_legislator = Legislator.new
  end

  # GET /admin/legislators/1/edit
  def edit
  end

  # POST /admin/legislators
  # POST /admin/legislators.json
  def create
    @admin_legislator = Legislator.new(admin_legislator_params)

    respond_to do |format|
      if @admin_legislator.save
        format.html { redirect_to [:admin, @admin_legislator], notice: 'Legislator was successfully created.' }
        format.json { render :show, status: :created, location: @admin_legislator }
      else
        format.html { render :new }
        format.json { render json: @admin_legislator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/legislators/1
  # PATCH/PUT /admin/legislators/1.json
  def update
    respond_to do |format|
      if @admin_legislator.update(admin_legislator_params)
        format.html { redirect_to [:admin, @admin_legislator], notice: 'Legislator was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_legislator }
      else
        format.html { render :edit }
        format.json { render json: @admin_legislator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/legislators/1
  # DELETE /admin/legislators/1.json
  def destroy
    @admin_legislator.destroy
    respond_to do |format|
      format.html { redirect_to admin_legislators_url, notice: 'Legislator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_legislator
      @admin_legislator = Legislator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_legislator_params
      params.require(:legislator).permit(:name, :party_id, :description, :constituency)
    end
end
