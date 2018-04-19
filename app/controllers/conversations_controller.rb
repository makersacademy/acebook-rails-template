# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating!,
                expect: [:index]

  def show
    @personal_messages = PersonalMessage.new
  end

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  private

  def set_conversation
    @conversation =  Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless
    @conversation&.participates?(current_user)
  end
end
