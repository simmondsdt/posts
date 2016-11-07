class PostsController < ApplicationController

  # Showing all of the posts
  # Looks for the index.html.erb template
  def index
    # Is going to get all posts
    @posts = Post.all
  end

  # Showing a single or specific post
  # Looks for the index.html.erb template
  def show
    # Is going to get a single post by ID
    @post = Post.find(params[:id])
  end

  # Creates a new instance in memory
  # Shows an empty for so the user can create a new post
  def new
    # Makes a new instance of a post
    @post = Post.new
  end

  # Runs the SQL query to add a new post to our database
  # Redirects or renders depending on the outcome
  # There is NO view associated with this method!
  def create
    # Saving the post with the form values into the database
    @post = Post.new(post_params)
    if @post.save
      # A successful new record in the database
      redirect_to post_path(@post)
    else
      # Unsuccessful create
      render :new
    end
  end

  # Finds a single post in the database
  # Looks for the edit.html.erb template and renders it
  def edit
    # Is going to edit a post
    @post = Post.find(params[:id])
  end

  # Finds a post in the database
  # Trying to update that post with the given params
  # Redirects or renders depending on the outcome
  # This method has NO view associated with it!
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      # Successful update in database
      redirect_to post_path(@post)
    else
      # Unsuccessful database update
      render :edit
    end
  end

  # Finds a single post in the database
  # Removes that record
  # Redirects to the index method
  # This method has NO view associated with it!
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    # Strong params
    def post_params
      params.require(:post).permit(:title, :body,
                                  :author, :public)
    end
end
