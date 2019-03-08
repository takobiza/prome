class ProfilesController < ApplicationController

  def index
    @template = Template.find(params[:template_id]);
  end

  def new
    @template = Template.includes(:user).find(params[:template_id]);
    @respondent = Respondent.new();
  end

  def create
    @profile = Profile.new(template_id: params[:template_id]);
    if @profile.save
      @respondent = Respondent.new(respondent_param(@profile));
      if @respondent.save
        if Answer.create(answer_param(@respondent));
          respond_to do |format|
            format.json {@success="成功",@redirect=profiles_complete_path}
          end
        end
      else
        respond_to do |format|
          format.json {@success="失敗"}
        end
      end
    end
  end

  def complete

  end

  def show
    @template = Template.find(params[:template_id]);
    @profile = Profile.find(params[:id]);
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

end

