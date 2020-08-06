class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        # render plain: params[:article].inspect # displaying parameters from form
        # @article = Article.new(params.require[:article])  # initialize new article model to save the data in the database
        # @article = Article.new(params.require(:article).permit(:title,:text)) # same as below
        @article = Article.new(article_params) # strong parameters
        # Article with capital A referes to app/models/article.rb which is a class name

        if @article.save # returns a boolean: saves the model in database
            redirect_to @article
        else
            render 'new' # the `@article` object passed back to `new` template when rendered
        end
    end

    # best practice:
    # order:
    # index, show, new, edit, create, update and destroy (public)
    # all must be declared before 'private' visibility controller
    private
        def article_params
            params.require(:article).permit(:title,:text)
        end

end
