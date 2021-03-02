class ChallengesController < ApplicationController
  before_action :authenticate_employee!
  before_action :assign_user, except: [:index]

  def index
    #@challenge = Challenge.paginate(:page => params[:page], :per_page => 100)
    #@challenge = Challenge.all.order("created_at desc")
    @challenge = Find_challenges.new(Challenge.all).call("asc")
  end

  def create
    @challenge = Challenge.new(set_params)
    @challenge.employee = current_employee
    if @challenge.save
      redirect_to root_path
    end
  end

  def upvote
    # if VoteService.new(params[:id], @user).create_factory(Vote)
    obj = VoteService.new(params[:id], @user)
    if obj.send(:create_factory, Vote)
      redirect_to root_path
    end
  end

  def downvote
    # if VoteService.new(params[:id], @user).delete_factory(Vote)
    obj = VoteService.new(params[:id], @user)
    if obj.send(:delete_factory, Vote)
      redirect_to root_path
    end
  end

  def collaborations
    obj = CollabService.new(params[:id], @user)
    # if CollabService.new(params[:id], @user).create_factory(Collaborator)
    if obj.send(:create_factory, Collaborator)
      ChallengeMailer.new_order_email.deliver_later
      redirect_to root_path
    end
  end

  def collaborationsdelete
    obj = CollabService.new(params[:id], @user)
    # if CollabService.new(params[:id], @user).delete_factory(Collaborator)
    if obj.send(:delete_factory, Collaborator)
      redirect_to root_path
    end
  end

  private

  def assign_user
    @user = current_employee
  end

  def set_params
    params.require(:challenges).permit(:title, :description, :tag, :employee_id)
  end
end
