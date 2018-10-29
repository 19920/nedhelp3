class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    puts current_user.last_name
     @users = User.all
       if current_user.present?
           @requests = Request.all
           respond_to do |format|
            format.html
            format.json { render json: @requests }
          end
           unless @requests.present?

              render :json=> {:message=>"Cannot find Request"}, :status=>ok
           end


       else
           @requests = Request.where(status: 0)
           unless @requests.present?
               json_response "Cannot find Request", true, {}, :ok
           end
           json_response "Index requests successfully", true, {requests: @requests}, :ok
       end
   end
   def owner
     puts current_user.last_name
      @users = User.all
        if current_user.present?
            @requests = Request.all
            respond_to do |format|
             format.html
             format.json { render json: @requests }
           end
            unless @requests.present?

               render :json=> {:message=>"Cannot find Request"}, :status=>ok
            end


        else
            @requests = Request.where(status: 0)
            unless @requests.present?
                json_response "Cannot find Request", true, {}, :ok
            end
            json_response "Index requests successfully", true, {requests: @requests}, :ok
        end
    end
   def request_counter
     @requests = Request.where(status:0).count
   end
  # GET /requests/1
  # GET /requests/1.json
  def show
      @request = Request.find(params[:id])
      @conversation= Conversation.new(id: @request.id)
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.json
  def create
        @request = Request.new(request_params)
        @request.user = current_user

        respond_to do |format|
            if @request.save
              format.html { redirect_to @request, notice: 'Request was successfully created.' }
              format.json { render :show, status: :created, location: @request }
            else
              format.html { render :new }
              format.json { render json: @request.errors, status: :unprocessable_entity }

            end
          end

    end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @request = Request.find(params[:id])


    respond_to do |format|
      if @request.update(conversations_count_params)
         @request.created_at = Time.now
         @request.conversations_count = 0
         @request.save
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end
  def republish
    @request = Request.find(params[:id])
         @request.created_at = Time.now
         @request.save
      redirect_to @request, notice: 'Request was successfully updated.'
  end
  def volunteer
       @request = Request.find(params[:id])
       @conversation = Conversation.create!(request_id: @request.id,sender_id: current_user.id,recipient_id: @request.user_id)
       redirect_to @request
     end


  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
     @request = Request.find(params[:id])
    end
    def conversations_count_params
            params.require(:request).permit(:conversations_count)
        end
    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
     params.require(:request).permit(:title, :description, :address, :request_type)
    end
end
