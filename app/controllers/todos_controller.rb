# 処理の流れ
# set_taskを実行し，idに従ってshow,edit,update,destroyから適切なタスクを見つけ，@taskにセットする
# 

class TodosController < ApplicationController
    # フィルタに該当するメソッドの実行前にこのアクションを実行するよ〜と定義
    before_action :set_todo, only: [:show, :edit, :update, :destroy]

    def index
        @todos = Todo.all
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            redirect_to @todo, notice: 'Todo was successfully created.'
        else
            render :new
        end
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            redirect_to @todo, notice: 'Todo was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @todo.destroy
        redirect_to tasks_url, notice: 'Todo was successfully destroyed.'
    end

    private
    # params[:id]に基づいて特定のTaskレコードがデータベースから取得され，インスタンス変数@taskにセットされる．
    def set_todo
        @todo = Todo.find(params[:id])
    end
    # フォームから送信されたパラメータを受け取る
    # params.require(:task)で:taskキーが含まれていることを確認する
    # permit(:titlem :completed)で:taskパラメータ内の:titleと:completedのみを許可する
    # 許可されたパラメータを返す
    def todo_params
        params.require(:todo).permit(:title, :completed)
    end
end

