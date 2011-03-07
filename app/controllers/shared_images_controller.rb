class SharedImagesController < ApplicationController
  protect_from_forgery :except => [:create_from_app]
  
  # POST /shared_images
  # POST /shared_images.xml
  def create_from_app
    @shared_image = SharedImage.new
    @shared_image.data_url = params[:shared_image][:data]
    @shared_image.save_from_data_url
    
    respond_to do |format|
      if @shared_image.save
        format.html { redirect_to(@shared_image, :notice => 'Shared image was successfully created.') }
        format.xml  { render :xml => @shared_image, :status => :created, :location => @shared_image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shared_image.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /shared_images
  # GET /shared_images.xml
  def index
    @shared_images = SharedImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shared_images }
    end
  end

  # GET /shared_images/1
  # GET /shared_images/1.xml
  def show
    @shared_image = SharedImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shared_image }
    end
  end

  # GET /shared_images/new
  # GET /shared_images/new.xml
  def new
    @shared_image = SharedImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shared_image }
    end
  end

  # GET /shared_images/1/edit
  def edit
    @shared_image = SharedImage.find(params[:id])
  end

  # POST /shared_images
  # POST /shared_images.xml
  def create
    @shared_image = SharedImage.new(params[:shared_image])

    respond_to do |format|
      if @shared_image.save
        format.html { redirect_to(@shared_image, :notice => 'Shared image was successfully created.') }
        format.xml  { render :xml => @shared_image, :status => :created, :location => @shared_image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shared_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shared_images/1
  # PUT /shared_images/1.xml
  def update
    @shared_image = SharedImage.find(params[:id])

    respond_to do |format|
      if @shared_image.update_attributes(params[:shared_image])
        format.html { redirect_to(@shared_image, :notice => 'Shared image was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shared_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shared_images/1
  # DELETE /shared_images/1.xml
  def destroy
    @shared_image = SharedImage.find(params[:id])
    @shared_image.destroy

    respond_to do |format|
      format.html { redirect_to(shared_images_url) }
      format.xml  { head :ok }
    end
  end
end
