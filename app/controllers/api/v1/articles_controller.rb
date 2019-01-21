module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :set_article, only: [:show, :update, :destroy]

      # GET /articles
      def index
        @articles = Article.all

        render json: @articles
      end

      # GET /articles/:id
      def show
        render json: @article = Article.find(params[:id])
      end

      # POST /articles
      def create
        @article = Article.create(article_params)

        if @article.save
          render json: @article, status: :created, location: @article
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /articles/1
      def update
        if @article.update(article_params)
          render json: @article
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      # DELETE /articles/1
      def destroy
        @article.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_article
          @article = Article.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def article_params
          params.require(:article).permit(:id, :title, :description, :author, :tags, :created_at, :updated_at)
        end
    end
  end
end