class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs
    if @jobs.empty?
      flash.now[:notice] = 'Nenhuma vaga disponível'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))
    if @category.save
      redirect_to @category
    else
      flash.now[:notice] = 'Nao foi possivel criar categoria'
      render :new
    end
  end

end
