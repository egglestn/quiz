# Controller for primary contents
class ContentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Content.where(category: Content.categories['question'])
    @explanations = Content.where(category: Content.categories['explanation'])
  end

  def show
    @selected = params[:selected] || -1

    if params[:answers].present?
      @answers = params[:answers]
    else
      @answers_to_pass = @content.answers.pluck(:text)
    end
  end

  def new
    @content = Content.new
    @others = Content.all
    4.times { @content.answers.build } unless @content.answers.length.positive?
  end

  def edit
    @others = Content.where.not(id: @content.id)
    4.times { @content.answers.build } unless @content.answers.length.positive?
  end

  def create
    @content = Content.new(content_params)
    @content[:next_id] = nil if content_params[:next_id].empty?

    if @content.save
      notice = t('success.create', name: @content.key)
      if content_params[:create_next].to_i > 0
        redirect_to new_content_path(previous_id: @content.id), notice: notice && return
      end
      redirect_to contents_path, notice: notice
    else
      render :new
    end
  end

  def update
    if @content.update(content_params)
      redirect_to @content, notice: t('success.update', name: @content.key)
    else
      render :edit
    end
  end

  def destroy
    # Only delete this record, not any related ones
    @content.next_id = ''
    @content.destroy
    redirect_to contents_url, notice: t('success.destroy', name: @content.key)
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
      :next_id,
      :category,
      :answers,
      :create_next,
      :previous_id,
      answers_attributes: [:id, :key, :text, :score]
    )
  end
end
