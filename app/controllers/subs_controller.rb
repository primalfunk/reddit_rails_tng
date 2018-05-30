class SubsController < ApplicationController 
  before_action :set_sub, only: [:show, :update, :edit, :destroy]
  after_action :more_cowbell
  
  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to @sub
    else
      render :form
    end
  end

  def update
    if @sub.update(sub_params)
      redirect_to @sub
    else
      render :form
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private
    def set_sub
      @sub = Sub.find(params[:id])
    end

    def sub_params
      params.require(:sub).permit(:name)
    end

    def more_cowbell
      Rails.logger.error "I got a fever..."
    end

end
