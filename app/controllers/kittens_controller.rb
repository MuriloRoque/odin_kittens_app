class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:notice] = 'You are making the world better!'
      redirect_to kittens_path
    else
      flash[:notice] = "You gotta be kidding me, can't you see you made a mistake?"
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:notice] = 'You edited your kitten succesfully!'
      redirect_to @kitten
    else
      flash[:notice] = "You gotta be kidding me, can't you see you made a mistake?"
      render 'edit'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice] = 'How could you do this? You monster!'
    redirect_to kittens_path
  end

  def apocalypse
    @kittens = Kitten.all
    @kittens.each(&:destroy)
    flash[:notice] = 'You are going to hell!'
    redirect_to kittens_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
