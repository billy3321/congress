class Admin::EntriesController < Admin::BaseController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /admin/entries
  # GET /admin/entries.json
  def index
    @entries = Entry.all
  end

  # GET /admin/entries/1
  # GET /admin/entries/1.json
  def show
  end

  # GET /admin/entries/new
  def new
    @entry = Entry.new
  end

  # GET /admin/entries/1/edit
  def edit
  end

  # POST /admin/entries
  # POST /admin/entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to [:admin, @entry], notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/entries/1
  # PATCH/PUT /admin/entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to [:admin, @entry], notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/entries/1
  # DELETE /admin/entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to admin_entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, {:legislator_ids => []}, :category_id, :description, :url)
    end
end
