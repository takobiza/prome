class TemplatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @templates = Template.where(user_id: current_user.id).page(params[:page]).per(3);
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @template = Template.new();
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
    @template = Template.find(Base64.decode64(params[:id]));
    @profiles = @template.profiles.includes(:respondent);
  end

  private
  def template_params
    params.permit(:question1, :question2, :question3, :question4, :question5).merge(user_id: current_user.id);
  end
end
