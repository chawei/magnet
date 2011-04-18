class LangMappingsController < ApplicationController
  # GET /lang_mappings
  # GET /lang_mappings.xml
  def index
    @lang_mappings = LangMapping.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lang_mappings }
    end
  end
  
  def links
    @links = []
    likes = LangMapping.statistics
    likes.each do |like|
      @links << { 'css_id' => "like-#{like.id}",
                  'like_text' => like.like_text, 
                  'locale' => like.locale, 
                  'btns_count' => like.btns_count,
                  'url' => "#{HOST}/lang_mappings/#{like.id}/detail.json" }
    end
    respond_to do |format|
      format.json  { render :json => @links, :callback => params[:callback] }
    end
  end

  def detail
    @like = LangMapping.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @like }
      format.json  { render :json => @like.exhibition, :callback => params[:callback] }
    end
  end
  
  # GET /lang_mappings/1
  # GET /lang_mappings/1.xml
  def show
    @lang_mapping = LangMapping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lang_mapping }
    end
  end

  # GET /lang_mappings/new
  # GET /lang_mappings/new.xml
  def new
    @lang_mapping = LangMapping.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lang_mapping }
    end
  end

  # GET /lang_mappings/1/edit
  def edit
    @lang_mapping = LangMapping.find(params[:id])
  end

  # POST /lang_mappings
  # POST /lang_mappings.xml
  def create
    @lang_mapping = LangMapping.new(params[:lang_mapping])

    respond_to do |format|
      if @lang_mapping.save
        format.html { redirect_to(@lang_mapping, :notice => 'Lang mapping was successfully created.') }
        format.xml  { render :xml => @lang_mapping, :status => :created, :location => @lang_mapping }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lang_mapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lang_mappings/1
  # PUT /lang_mappings/1.xml
  def update
    @lang_mapping = LangMapping.find(params[:id])

    respond_to do |format|
      if @lang_mapping.update_attributes(params[:lang_mapping])
        format.html { redirect_to(@lang_mapping, :notice => 'Lang mapping was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lang_mapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lang_mappings/1
  # DELETE /lang_mappings/1.xml
  def destroy
    @lang_mapping = LangMapping.find(params[:id])
    @lang_mapping.destroy

    respond_to do |format|
      format.html { redirect_to(lang_mappings_url) }
      format.xml  { head :ok }
    end
  end
end
