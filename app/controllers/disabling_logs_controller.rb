class DisablingLogsController < ApplicationController
  caches_page :count
  
  def add
    return if params[:authenticity_token] != "ogoKH6Gei/sAnYtsK2WIhuFAZVmahD7eBCtrrQswoD4="
    @disabling_log = DisablingLog.new(params[:disabling_log])

    respond_to do |format|
      if @disabling_log.save
        expire_page :action => :count, :format => :json
        
        format.html { redirect_to(@disabling_log, :notice => 'Disabling log was successfully created.') }
        format.json { render :json => { :status => 'ok' } }
      else
        format.html { render :action => "new" }
        format.json { render :json => { :status => 'fail' } }
      end
    end
  end
  
  def count
    @count = DisablingLog.total_count
    
    respond_to do |format|
      format.json  { render :json => { :count => @count } }
    end
  end
  
  # GET /disabling_logs
  # GET /disabling_logs.xml
  def index
    @disabling_logs = DisablingLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @disabling_logs }
    end
  end

  # GET /disabling_logs/1
  # GET /disabling_logs/1.xml
  def show
    @disabling_log = DisablingLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @disabling_log }
    end
  end

  # GET /disabling_logs/new
  # GET /disabling_logs/new.xml
  def new
    @disabling_log = DisablingLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @disabling_log }
    end
  end

  # GET /disabling_logs/1/edit
  def edit
    @disabling_log = DisablingLog.find(params[:id])
  end

  # POST /disabling_logs
  # POST /disabling_logs.xml
  def create
    @disabling_log = DisablingLog.new(params[:disabling_log])

    respond_to do |format|
      if @disabling_log.save
        expire_page :action => :count, :format => :json
        
        format.html { redirect_to(@disabling_log, :notice => 'Disabling log was successfully created.') }
        format.xml  { render :xml => @disabling_log, :status => :created, :location => @disabling_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @disabling_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /disabling_logs/1
  # PUT /disabling_logs/1.xml
  def update
    @disabling_log = DisablingLog.find(params[:id])

    respond_to do |format|
      if @disabling_log.update_attributes(params[:disabling_log])
        format.html { redirect_to(@disabling_log, :notice => 'Disabling log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @disabling_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /disabling_logs/1
  # DELETE /disabling_logs/1.xml
  def destroy
    @disabling_log = DisablingLog.find(params[:id])
    @disabling_log.destroy

    respond_to do |format|
      format.html { redirect_to(disabling_logs_url) }
      format.xml  { head :ok }
    end
  end
end
