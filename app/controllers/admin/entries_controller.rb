class Admin::EntriesController < ApplicationController
  before_action :set_admin_entry, only: [:show, :edit, :update, :destroy]

  # GET /admin/entries
  # GET /admin/entries.json
  def index
    @admin_entries = Entry.all
  end

  # GET /admin/entries/1
  # GET /admin/entries/1.json
  def show
  end

  # GET /admin/entries/new
  def new
    @admin_entry = Entry.new
  end

  # GET /admin/entries/1/edit
  def edit
  end

  # POST /admin/entries
  # POST /admin/entries.json
  def create
    @admin_entry = Entry.new(admin_entry_params)

    respond_to do |format|
      if @admin_entry.save
        format.html { redirect_to [:admin, @admin_entry], notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @admin_entry }
      else
        format.html { render :new }
        format.json { render json: @admin_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/entries/1
  # PATCH/PUT /admin/entries/1.json
  def update
    respond_to do |format|
      if @admin_entry.update(admin_entry_params)
        format.html { redirect_to [:admin, @admin_entry], notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_entry }
      else
        format.html { render :edit }
        format.json { render json: @admin_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/entries/1
  # DELETE /admin/entries/1.json
  def destroy
    @admin_entry.destroy
    respond_to do |format|
      format.html { redirect_to admin_entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_entry
      @admin_entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_entry_params
      params.require(:entry).permit(:title, :category_id, :description, :url)
    end
end
