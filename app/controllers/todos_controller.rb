class TodosController < ApplicationController
	
	def index
		todo = Todo.all
		render json: todo
		
	end
	
	def create
		todo = Todo.new(todo_paramats)
		todo.save
		if todo.save
			render json: todo
			
		else
			render json: {message: " not save sucessfull"}
		end
		
	end

	def show
		todo = Todo.find(params[:id])
		render json: todo
		
	end

	def update
		todo = Todo.update(params[:id], todo_paramats)
		todo.save
	end

	def destroy
		todo = Todo.find(paramas[:id])
		todo.delete()
		render json: {message: " User was remove"}
		
	end

	private

		def todo_paramats
			params.require(:todo).permit(:text, :done)		
		end
end