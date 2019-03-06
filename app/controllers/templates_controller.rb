class TemplatesController < ApplicationController
  def index
    @templates = Template.where(user_id: current_user.id);
  end

  def new
    @template = Template.new();
  end

  def create
    @template = Template.create(template_params);
    redirect_to templates_path, notice: 'テンプレートを作成しました'
  end

  def show
    @template = Template.find(params[:id]);
    @profiles = @template.profiles.includes(:respondent);
  end
  private
  def template_params
    params.require(:template).permit(:question1, :question2, :question3, :question4, :question5).merge(user_id: current_user.id);
  end
end
