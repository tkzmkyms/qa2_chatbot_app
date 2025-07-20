require "csv"

# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def index
    @messages = Message.order(:created_at)
    @message = Message.new
  end

  def create
    @message = Message.new(content: params[:message][:content], sender: "user")

    if @message.save
      bot_reply = generate_bot_reply(@message.content)
      @bot_message = Message.create(content: bot_reply, sender: "bot")
    else
      @bot_message = nil
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  private

  def generate_bot_reply(user_input)
    csv_path = Rails.root.join("db", "qa_data.csv")
    user_input_clean = user_input.to_s.strip.downcase

    CSV.foreach(csv_path, headers: true) do |row|
      question = row["question"].to_s.strip.downcase
      answer = row["answer"].to_s.strip

      if user_input_clean.include?(question) || question.include?(user_input_clean)
        return answer
      end
    end

    "すみません、よくわかりませんでした。"
  end
end
