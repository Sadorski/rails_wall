class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.new(params.require(:user).permit(:username))
    if @user.save
      session[:id] = User.last.id
      session[:username] = User.last.username 
      redirect_to '/messages'
    else
      flash[:notice] = ["Username name can't be less than 5 characters"]
      redirect_to '/users/new'
    end
  end
  def messages
    if session[:id].nil?
      redirect_to '/users/new'
    else
      @user = User.find(session[:id])
      @messages = Message.all 
      @comments = Comment.all
    end
  end
  def createmessage
    @message = Message.create(content: params[:content], user_id: session[:id])
    if @message.save
      redirect_to '/messages'
    else
      flash[:notice] = ["Message content can't be less than 10 characters"]
      redirect_to '/messages'
    end
  end
  def createcomment
    @comment = Comment.create(content: params[:content], user_id: session[:id], message_id: params[:msg_id])
    if @comment.save
      redirect_to '/messages'
    else
      flash[:notice] = ["Comment content can't be less than 1 characters"]
      redirect_to '/messages'
    end
  end
  def logout
    session[:username] = nil
    session[:id] = nil
    redirect_to '/users/new'
  end
end

