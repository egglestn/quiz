class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.all
  end

  def show
  end

  def new
    @content = Content.new
  end

  def edit
  end

  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to @content, notice: 'Content was successfully created.'
    else
      render :new
    end
  end


  def update
  if @content.update(content_params)
    redirect_to @content, notice: 'Content was successfully updated.'
  else
    render :edit
  end
  end

  def destroy
    @content.destroy
    redirect_to contents_url, notice: 'Content was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(
            :text,
            :key,
            :section,
            :content_id,
            :score,
            :category
          )
    end
end
