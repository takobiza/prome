class TemplatesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery :except => [:destroy]

  def index
    @templates = Template.where(user_id: current_user.id).page(params[:page]).per(3)
  end

  def new
    @template = Template.new()
  end

  def create
    @template = Template.new(template_params);
    if @template.save
      redirect_to templates_path, notice: 'テンプレートを作成しました'
    else
      flash.now[:notice] = "テンプレートの作成に失敗しました"
      render :new
    end
  end

  def show
    @template = Template.find(params[:id])
    @profiles = @template.profiles.includes(:respondent)
  end

  def destroy
    @template = Template.find(params[:id])

    if @template.destroy
      redirect_to templates_path, notice: 'テンプレートを削除しました'
    end
  end

  private
  def template_params
    params.permit(:question1, :question2, :question3, :question4, :question5).merge(user_id: current_user.id)
  end
end
