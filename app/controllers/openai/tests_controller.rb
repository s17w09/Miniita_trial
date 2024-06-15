class Openai::TestsController < ApplicationController
        protect_from_forgery
      
        def show; end
      
        def generate_text
          @user_input = params[:user_input]
      
          if @user_input.present?
            client = OpenAI::Client.new
            response = client.chat(
              parameters: {
                model: "gpt-4o",
                messages: [
                  { role: "system", content: "あなたは優秀なエンジニアです。初心者エンジニアでもわかるように、userの質問に回答してください" },
                  { role: "user", content: @user_input }
                ],
                # 生成するテキストの創造性やランダム性を制御するパラメータ。値が低いと、より決定論的な（予測可能な）応答を生成し、値が高いと、より多様で創造的な応答を生成する
                temperature: 0.2
              }
            )

            # digメソッドは、ネストされたハッシュや配列から値を安全に取得するための便利なメソッド。キーが存在しない場合でもエラーを出さずにnilを返すため、ネストが深いデータ構造を扱う際に役立つ。
            @generated_text = response.dig("choices", 0, "message", "content")
            render json:{text: @generated_text}
          end
        end
      end
