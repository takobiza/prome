class ProfilesController < ApplicationController
  before_action :set_template, only:[:index, :new,:show]
  before_action :authenticate_user!, except:[:new,:create,:complete]
  protect_from_forgery :except => [:destroy]

  def index

  end

  def new
    @respondent = Respondent.new();
  end

  def create
    template = Template.find(params[:template_id])
    @profile = Profile.new(template_id: template.id)
    if @profile.save
      @respondent = Respondent.new(respondent_param(@profile))
      if @respondent.save
        if Answer.create(answer_param(@respondent));
          respond_to do |format|
            format.json {@success="成功",@redirect=profiles_complete_path}
          end
        end
      else
        @profile.destroy;
        respond_to do |format|
          format.json {@success="失敗"}
        end
      end
    end
  end

  def complete

  end

  def show
    @profile = Profile.find(params[:id])
    @respondent = @profile.respondent;
    @answer = @respondent.answer;
  end

  def destroy
    @profile = Profile.find(params[:id])
    template = Template.find(params[:template_id])
    nickname = @profile.respondent.name
    if @profile.destroy
      redirect_to template_path(template), notice: nickname+'さんのプロフィールを削除しました'
    end
  end

  private
  def respondent_param(profile)
    params.permit(:name, :height, :bodyweight, :profession, :image,:year,:month, :day, :firstperson, :blood,:sign, :charmpoint, :personality, :skill, :hobby,:favoritefood,:dislikefood, :dream,:wish).merge(profile_id: profile.id)
  end

  def answer_param(respondent)
    params.permit(:answer1, :answer2, :answer3, :answer4, :answer5).merge(respondent_id: respondent.id)
  end

  def set_template
    @template = Template.includes(:user).find(params[:template_id]);
  end

end

