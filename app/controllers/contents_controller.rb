class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Content.where(category: Content.categories["answer"])
    @questions = Content.where(category: Content.categories["question"])
    @explanations = Content.where(category: Content.categories["explanation"])
  end

  def show
  end

  def new
    @content = Content.new
    4.times { @content.relationships.build } unless @content.relationships.length.positive?
 end

  def edit
    if @content.relationships.empty?
      4.times { @content.relationships.build }
    end
    puts "====================="
    puts "Built relationships"
    puts @content.relationships.length
    puts @content.relationships.length.positive?
    puts @content.relationships.empty?
    puts "====================="
  end

  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to @content, notice: t("success.create", name: @content.key)
    else
      render :new
    end
  end

  def update
      puts "====================="
      puts @content
      puts content_params[:content_ids]
      puts "====================="
    if @content.update(content_params)

    redirect_to @content, notice: t("success.update", name: @content.key)
  else
    render :edit
  end
  end

  def destroy
    @content.destroy
    redirect_to contents_url, notice: t("success.destroy", name: @content.key)
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
            :content_ids,
            :score,
            :category,
            relationships_attributes: [:to_content]
         )
    end
end
