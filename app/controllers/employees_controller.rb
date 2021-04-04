class EmployeesController < ApplicationController
  before_action :find_employee, only: %i[show edit create destroy update]

  def index
    @employees = Employee.all
  end

  def new
    @dogs = Dog.all
    @employee = Employee.new
  end

  def edit
    @dogs = Dog.all
  end

  def create
    @employee = Employee.new(employee_params)

    @employee.save ? (redirect_to employee_path(@employee.id)) : (render :new)
  end

  def update
    @employee.update(employee_params) ? (redirect_to employee_path(@employee.id)) : (render :edit)
  end

  private

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
  end
end
