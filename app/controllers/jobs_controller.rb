class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured))
    if @job.save
      redirect_to @job
    else
      @companies = Company.all
      flash.now[:notice] = "Não foi possível criar a vaga"
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured))
      redirect_to @job
    else
      flash.now[:notice] = "Não foi possível atualizar a vaga"
      @companies = Company.all
      render :edit
    end
  end

end
