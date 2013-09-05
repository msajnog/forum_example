class TopicsController < ApplicationController
  before_action :find_forum, :set_topic, only: [:show, :edit, :update, :destroy]

  def find_forum
    @forum = Forum.find(params[:forum_id])
  end

  # GET /topics
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
    @topic = @forum.topics.build
    @post = @topic.posts.build
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  def create
    @topic = @forum.topics.build(params)
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic, notice: 'Topic was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topic was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
    redirect_to topics_url, notice: 'Topic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :last_poster_id, :last_poster_at, :posts_attributes => [:id, :content])
    end
end
