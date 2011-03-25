class LikeButtonsController < ApplicationController
  # GET /like_buttons
  # GET /like_buttons.xml
  def index
    @like_buttons = LikeButton.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @like_buttons }
    end
  end

  # GET /like_buttons/1
  # GET /like_buttons/1.xml
  def show
    @like_button = LikeButton.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @like_button }
    end
  end

  # GET /like_buttons/new
  # GET /like_buttons/new.xml
  def new
    @like_button = LikeButton.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @like_button }
    end
  end

  # GET /like_buttons/1/edit
  def edit
    @like_button = LikeButton.find(params[:id])
  end

  # POST /like_buttons
  # POST /like_buttons.xml
  def create
    @like_button = LikeButton.new(params[:like_button])

    respond_to do |format|
      if @like_button.save
        format.html { redirect_to(@like_button, :notice => 'Like button was successfully created.') }
        format.xml  { render :xml => @like_button, :status => :created, :location => @like_button }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @like_button.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /like_buttons/1
  # PUT /like_buttons/1.xml
  def update
    @like_button = LikeButton.find(params[:id])

    respond_to do |format|
      if @like_button.update_attributes(params[:like_button])
        format.html { redirect_to(@like_button, :notice => 'Like button was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @like_button.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /like_buttons/1
  # DELETE /like_buttons/1.xml
  def destroy
    @like_button = LikeButton.find(params[:id])
    @like_button.destroy

    respond_to do |format|
      format.html { redirect_to(like_buttons_url) }
      format.xml  { head :ok }
    end
  end
end
