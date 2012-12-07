class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user = login(@user.username,@user.password)
        format.html { redirect_to(:users, :notice => 'Login successful.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else      
        format.html { redirect_to(:login, :notice => 'Login Failed.') }
        format.xml { render :xml => @user, :status => :unprocessable_entity }
      end
    end
  end
    
  def destroy
    logout
    redirect_to(:users, :notice => 'Logged out!')
  end
end
