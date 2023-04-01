class BookmarksController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    current_user.bookmark(post)
    redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
  end

  def destroy
    post = current_user.bookmarks.find(params[:id]).post
    current_user.unbookmark(post)
    redirect_back fallback_location: root_path, success: t('defaults.message.unbookmark')
  end
end
