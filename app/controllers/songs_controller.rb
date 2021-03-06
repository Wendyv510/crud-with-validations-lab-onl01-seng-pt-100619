class SongsController < ApplicationController

    def index 
        @songs = Song.all 
    end 

    def new 
        @song = Song.new 
    end 

    def show 
        @song = Song.find(params[:id]) 
    end 

    def create 
        @song = Song.create!(song_params) 
        if @song.valid?
           @song.save 
               redirect_to song_path(@song)
        else 
            render :'songs/new'         
        end 
    end 

    def edit 
        @song = Song.find(params[:id]) 
    end 

    def update 
        @song = Song.find(params[:id])
        if @song.valid?  
           @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
             redirect_to song_path(@song)
        else 
          render :edit
        end  
    end 

    def destroy 
        Song.find(params[:id]).destroy 
          redirect_to songs_path 
    end 

    private 

    def song_params 
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 

end
