# Controller for primary contents
class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Content.where(category: Content.categories['question'])
    @explanations = Content.where(category: Content.categories['explanation'])
    @section = t('dashboard.show.admin_dashboard')
  end

  def show
    @selected = params[:selected] || -1
    @previous = Content.where(next: @content.id).first
    @options = @content.answers.pluck(:text)
  end

  def new
    @content = Content.new
    @others = Content.all
    @previous_id = params[:previous_id]

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
      update_previous
      successful_save('success.create')
    else
      render :new
    end
  end

  def update
    if @content.update(content_params)
      successful_save('success.update')
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

  def update_previous
    prev_id = content_params[:previous_id]
    return if prev_id.to_i < 0
    @previous = Content.find(prev_id)
    @previous.update_attribute(:next_id, @content.id)
  end

  def successful_save(method_name)
    notice = t(method_name, name: @content.key)
    if params[:commit] == t('save')
      redirect_to contents_path, notice: notice
    else
      redirect_to new_content_path(previous_id: @content.id), notice: notice
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_content
    @content = Content.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def content_params
    params.require(:content).permit(
      :text, :key,
      :section, :next_id,
      :category, :answers,
      :create_next, :previous_id,
      :footnotes, :background_link,
      answers_attributes: [:id, :key, :text, :score]
    )
  end
end
