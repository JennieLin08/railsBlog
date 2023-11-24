class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update delete ]
    def index
        @members = Member.all
    end

    def new
        @member = Member.new
    end

    def show

    end

    def edit
        respond_to do |format|
            if @member.update(member_params)
              format.html { redirect_to article_url(@member), notice: "Member was successfully updated." }
              format.json { render :show, status: :ok, location: @member }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @member.errors, status: :unprocessable_entity }
            end
          end

    end

    def create
        # @member = Member.new(member_params)
        # # @member.name = params[:name]
        # # @member.username = params[:username]
        # # @member.email = params[:email]
        
        # if @member.save
        #     redirect_to members_path
        # else
        #     render :new
        # end


        @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to article_url(@member), notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end

    end

   

    def update
    end

    def delete
        @member.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Member was successfully deleted." }
      format.json { head :no_content }
    end
    end

    private
    def set_member
        @member = Member.find(params[:id])
      end

        def member_params
        params.require(:member).permit(:name,:username,:email)
        end

end
