class ChatroomUsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_chatroom

    def create
        offset = rand(RandomName.count)
        rand_record = RandomName.offset(offset).first
        
        @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id, hidden_name: rand_record.username).new
        
        if @chatroom.activity.cost.to_i > 0

            token = params[:stripeToken]
            card_brand = params[:user][:card_brand]
            card_exp_month = params[:user][:card_exp_month]
            card_exp_year = params[:user][:card_exp_year]
            card_last4 = params[:user][:card_last4]
      
            charge = Stripe::Charge.create(
              amount: @chatroom.activity.cost * 100 / @chatroom.activity.attendee_max,
              currency: "gbp",
              description: @chatroom.activity.title,
              source: token
            )
            current_user.stripe_id = charge.id
            current_user.card_brand = card_brand
            current_user.card_exp_month = card_exp_month
            current_user.card_exp_year = card_exp_year
            current_user.card_last4 = card_last4
            current_user.save!

        end

        respond_to do |format|
            if @chatroom_user.save
              format.html { redirect_to root_path, notice: 'Meeting was successfully created.' }
              format.json { render :show, status: :created, location: root_path }
            else
              format.html { render :new }
              format.json { render json: @meeting.errors, status: :unprocessable_entity }
            end
          end

        rescue Stripe::CardError => e
            flash.alert = e.message
            render action: :new
    end

    def destroy
        @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
        redirect_to root_path
    end

    private
    def set_chatroom
        @chatroom = Chatroom.find(params[:chatroom_id])
    end
end
