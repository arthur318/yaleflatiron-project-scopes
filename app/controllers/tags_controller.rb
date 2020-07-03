class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
  end
  
  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    Tag.create(tag_params)
    redirect_to "/tags"
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  def edit
    @tag = Tag.find(params[:id])
end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to "/tags"
  end

end
