class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update]
  before_action :set_collections, only: [:new, :edit]

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      flash.now[:notice] = 'Não foi possível criar a vaga'
      set_collections
      render :new
    end
  end

  def edit
  end

  def update
     if @job.update(job_params)
      redirect_to @job
    else
      flash.now[:notice] = 'Não foi possível atualizar a vaga'
      set_collections
      render :edit
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :company_id, :description, :location, :category_id, :featured)
  end

  def set_collections
    @companies = Company.all
    @categories = Category.all
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
