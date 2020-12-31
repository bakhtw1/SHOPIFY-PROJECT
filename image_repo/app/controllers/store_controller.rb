class StoreController < ApplicationController

    def home
        puts " ***************** Store loaded ***************** "
        @images = Dir.children("app/assets/images/store_images")
    end

end
