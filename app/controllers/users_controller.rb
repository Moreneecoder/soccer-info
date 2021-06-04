class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :current_user, only: %i[top_writer]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save

        session[:user_id] = @user.id

        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def signin; end

  def start_user_session
    if User.exists?(name: params[:name])
      @user = User.find_by(name: params['name'])
      session[:user_id] = @user.id
      flash[:notice] = 'You logged in successfully'
      redirect_to root_path
    else
      flash[:alert] = 'Invalid Username'
      render :signin
    end
  end

  def top_writer
    @writer = fetch_top_writer
    @votes = top_writer_votes
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def end_user_session
    session[:user_id] = nil
    redirect_to users_signin_path
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end

  def group_authors_by_votes
    user_by_votes = User.includes(:articles).map do |author|
      author_votes_pair = [author.id, 0]

      author.articles.includes(:votes).each do |article|
        author_votes_pair[1] += article.votes.count
      end

      author_votes_pair
    end

    user_by_votes.to_h
  end

  def fetch_top_writer
    top_writer_id = group_authors_by_votes.max_by { |_k, v| v }[0]
    User.find(top_writer_id)
  end

  def top_writer_votes
    group_authors_by_votes.max_by { |_k, v| v }[1]
  end
end
