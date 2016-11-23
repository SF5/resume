class OpenUniversitiesController < ApplicationController
  before_action :set_open_university, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [ :index, :show ]
  helper_method :sort_column, :sort_direction
  before_action :clear_search_index, :only => [:index]

  # GET /open_universities
  # GET /open_universities.json
  def index
    @search = OpenUniversity.search(search_params)
    #@search.sorts = 'year asc' if @search.sorts.empty?
    @open_universities = @search.result().order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    @search.build_condition if @search.conditions.empty?

  # @open_universities = OpenUniversity.order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end

  # GET /open_universities/1
  # GET /open_universities/1.json
  def show
  end

  # GET /open_universities/new
  def new
    @open_university = OpenUniversity.new
  end

  # GET /open_universities/1/edit
  def edit
  end

  # POST /open_universities
  # POST /open_universities.json
  def create
    @open_university = OpenUniversity.new(open_university_params)

    respond_to do |format|
      if @open_university.save
        format.html { redirect_to @open_university, notice: 'Open university was successfully created.' }
        format.json { render :show, status: :created, location: @open_university }
      else
        format.html { render :new }
        format.json { render json: @open_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /open_universities/1
  # PATCH/PUT /open_universities/1.json
  def update
    respond_to do |format|
      if @open_university.update(open_university_params)
        format.html { redirect_to @open_university, notice: 'Open university was successfully updated.' }
        format.json { render :show, status: :ok, location: @open_university }
      else
        format.html { render :edit }
        format.json { render json: @open_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /open_universities/1
  # DELETE /open_universities/1.json
  def destroy
    @open_university.destroy
    respond_to do |format|
      format.html { redirect_to open_universities_url, notice: 'Open university was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_open_university
    @open_university = OpenUniversity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def open_university_params
    params.require(:open_university).permit(:course, :code, :year)
  end

  def sort_column
    OpenUniversity.column_names.include?(params[:sort]) ? params[:sort] : "year"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def search_params
    params[:q]
  end

  def clear_search_index
    if params[:search_cancel]
      params.delete(:search_cancel)
      if(!@search.nil?)
        @search.each do |key, param|
          @search[key] = nil
        end
      end
    end
  end
end
