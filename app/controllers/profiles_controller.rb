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
    @respondent = @profile.respondents.new(respondent_param);
    @profile.save
    @respondent.save
    @answer = Answer.create(answer_param(@respondent));
  end

  private
  def respondent_param
    params.permit(:name, :height, :bodyweight, :profession, :image,:year,:month, :day, :firstperson, :blood,:sign, :charmpoint, :personality, :skill, :hobby,:favoritefood,:dislikefood, :dream,:wish)
  end

  def answer_param(respondent)
    params.permit(:answer1, :answer2, :answer3, :answer4, :answer5).merge(respondent_id: respondent.id)
  end
end

