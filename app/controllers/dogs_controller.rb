class DogsController < ApplicationController
  before_action :find_dog, only: %i[show edit create destroy]

  def index
    if params[:sort]
      @dogs = Adopter.all.sort_by do |dog|
        dog.employees.count
      end.reverse 
    else 
      @dogs = Adopter.all
    end
    @dogs = Dog.all
  end

  
  private

  def find_dog
    @dog = Dog.find(params[:id])
  end
end
