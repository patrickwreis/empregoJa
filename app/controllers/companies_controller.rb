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
    @company = Company.create(params.require(:company).permit(:name, :location, :mail, :phone))
    redirect_to @company
  end
end
