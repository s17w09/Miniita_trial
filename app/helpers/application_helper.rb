module ApplicationHelper
    class HTMLwithCoderay < Redcarpet::Render::HTML
      def block_code(code, language)
        case language.to_s
        when 'rb'
          lang = 'ruby'
        when 'yml'
          lang = 'yaml'
        when ''
          # 空欄のままだと「Invalid id given:」エラー
          lang = 'md'
        else
          lang = language
        end
  
        CodeRay.scan(code, lang).div
      end
    end
  
    def markdown(text)
      html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
      options = {
        autolink: true,  # URLやメールアドレスを自動的にリンクに変換、gyazo,通常のリンクテキスト対応
        space_after_headers: true, #見出し後の文字の大きさ変換。app/assets/stylesheets/redcarpet_custom.cssでCSS指定し、app/assets/config/manifest.jsとapp/views/layouts/application.html.erbで指定。
        fenced_code_blocks: true, #コードブロックで表示
        tables: true,
        hard_wrap: true, # 改行を <br> タグに変換
        lax_html_blocks: true, # HTMLブロックを緩やかに解析するオプション。区切り線は通常のredcarpetにも入っているが、マークダウンとHTMLの混在をスムーズに処理してくれる
        no_intra_emphasis: true, #語句の強調。「**強調**」で強調される。（**の後にスペースなし）
        strikethrough: true # 打ち消し線（ストライクスルー）。「~~打ち消し線~~」で打ち消し線が入る
      }

      extensions = {
      fenced_code_blocks: true
    }

      markdown    = Redcarpet::Markdown.new(html_render, options)
      markdown.render(text)
    end
  end
  