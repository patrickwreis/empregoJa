class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
    @jobs = @company.jobs
    if @jobs.empty?
      flash.now[:notice] = 'Nenhuma vaga disponível'
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params.require(:company).permit(:name, :location, :mail, :phone))
    if @company.save
      redirect_to @company
    else
      flash.now[:notice] = 'Não foi possível criar empresa'
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(params.require(:company).permit(:name, :location, :mail, :phone))
      redirect_to @company
    else
      flash.now[:notice] = 'Não foi possivel atualizar a empresa'
      render :edit
    end
  end

end
