module CurrentWishlist
  private
    def set_wishlist
      @wishlist = Wishlist.find(session[:wish_id])
    rescue ActiveRecord::RecordNotFound
      @wishlist = Wishlist.create
      session[:wish_id] = @wishlist.id
    end
end