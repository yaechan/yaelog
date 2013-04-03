class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, null: false          # ニックネーム
      t.text :comment, null: false         # コメント
      t.date :birthday, null: false      # 生年月日
      t.string :hometown, null: false      # 出身地
      t.string :bloodtype, null: false     # 血液型
      t.string :university, null: false    # 出身大学
      t.string :ability, null: false       # 特技
      t.string :hobby, null: false         # 趣味
      t.string :merit, null: false         # 長所
      t.string :demerit, null: false       # 短所
      t.string :favorite_word, null: false # 好きな言葉
      t.string :language, null: false      # 使える言語
      t.string :favorite_language, null: false    # 好きな言語
      t.string :favorite_tool, null: false # 好きな開発ツール
      t.string :editor, null: false        # 使用エディタ
      t.string :hashed_password, null: false    # パスワード

      t.timestamps
    end
  end
end
