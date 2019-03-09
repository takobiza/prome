class ProfilesController < ApplicationController
  before_action :set_template, only:[:index, :new,:show]
  before_action :authenticate_user!, except:[:new,:create,:complete]

  def index

  end

  def new
    @respondent = Respondent.new();
  end

  def create
    @profile = Profile.new(template_id: Base64.decode64(params[:template_id]));
    if @profile.save
      @respondent = Respondent.new(respondent_param(@profile));
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
    @profile = Profile.find(Base64.decode64(params[:id]));
    @respondent = @profile.respondent;
    @answer = @respondent.answer;
  end

  private
  def respondent_param(profile)
    params.permit(:name, :height, :bodyweight, :profession, :image,:year,:month, :day, :firstperson, :blood,:sign, :charmpoint, :personality, :skill, :hobby,:favoritefood,:dislikefood, :dream,:wish).merge(profile_id: profile.id)
  end

  def answer_param(respondent)
    params.permit(:answer1, :answer2, :answer3, :answer4, :answer5).merge(respondent_id: respondent.id)
  end

  def set_template
    @template = Template.includes(:user).find(Base64.decode64(params[:template_id]));
  end

end

