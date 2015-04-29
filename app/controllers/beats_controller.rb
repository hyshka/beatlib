class BeatsController < ApplicationController
  respond_to :html, :js

  def index
    @favorites = Favorite.all

    @beats = Beat.all
    # ransack search with session control for sorting
    @q = @beats.search(params[:q] ? params[:q] : session[:search])
    @beats = @q.result(distinct: true)
    if params[:q]
      session[:search] = params[:q]
    end

    # @beats.reorder('title').each // sort by name, A -> Z
    # @beats.reorder('created_at').each // sort by newest created
    # @beats.each // sort by popularity (most votes) // in BeatsController: @beats = Beat.tally
    # @beats.where(genre: 'Rock').each // show beats only from this genre

    @selected_tag = params[:tag]
    if params[:tag] == "all" or params[:tag] == nil
      @tsorted = @beats
    else
      @tsorted = @beats.tagged_with(@selected_tag)
    end

    if params[:sort] == "popular" or params[:sort] == nil
      @selected_sort = "Popular"
      @sorted = @tsorted.reorder('downloads').reverse_order
    elsif params[:sort] == "latest"
      @selected_sort = "Latest"
      @sorted = @tsorted.reorder('created_at').reverse_order
    end

    @sorted_beats = @sorted.paginate(:page => params[:page], :per_page => 8)

    # ajax response
    respond_with( @sorted_beats, :layout => !request.xhr? )
  end

  def show
    @favorites = Favorite.all
    @beat = Beat.find(params[:id])
  end

  def new
    @beat = Beat.new
  end

  def edit
    @beat = Beat.find(params[:id])
  end

  def create
    @beat = Beat.new(beat_params)

    if @beat.save
      redirect_to @beat
    else
      render 'new'
    end
  end

  def update
    @beat = Beat.find(params[:id])

    if @beat.update(beat_params)
      redirect_to @beat
    else
      render 'edit'
    end
  end

  def destroy
    @beat = Beat.find(params[:id])
    #@beat.destroy
    @beats = Beat.all

    # This assumes users can only delete from their profile
    # redirect_to user_path(current_user)
    flash[:notice] = "Beat successfully removed" if @beat.destroy
    respond_with( @beats, :layout => !request.xhr? )
  end

  def download
    @beat = Beat.find(params[:id])
    @beat.increment!(:downloads)

    #respond_to do |format|
    #  format.html { send_file @beat.midi.path }
    #  format.js
    #end

    #send_file @beat.midi.path
    cookies['fileDownload'] = 'true'
    respond_with( @beat.midi.path, :layout => !request.xhr? )
  end

  private
    def beat_params
      params.require(:beat).permit(:title, :description, :genre, :midi, :user_id, :created_by, :tag_list => [])
    end
end
