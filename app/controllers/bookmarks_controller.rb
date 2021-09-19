class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit update destroy ]

  # GET /bookmarks or /bookmarks.json
  def index
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.all
    @types = Type.all
    @categories = Category.all
    
    
   
  end


  # GET /bookmarks/1 or /bookmarks/1.json
  def show
    @types = Type.all
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
    @types = Type.all
    @categories = Category.all
  end

  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html do
          redirect_to '/'
        end
        format.json { render json: @bookmark.to_json }
      else
        format.html { render 'new'} ## Specify the format in which you are rendering "new" page
        format.json { render json: @bookmark.errors } ## You might want to specify a json format as well
      end
    end
  

    @types = Type.all
  end

  # PATCH/PUT /bookmarks/1 or /bookmarks/1.json
  def update
    @bookmark.update(bookmark_params)
    @types = Type.all
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @types = Type.all
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Bye bye deleted Bookmark" }
      format.json { head :no_content }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:address, :type_id, :category_id)
    end
end
