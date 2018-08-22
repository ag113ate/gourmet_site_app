# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ========================== ハンバーグセット（開始）===========================
# 料理名、説明分の設定
FoodMenu.create(:title => "ハンバーグセット（ライス、スープ、ドリンク付き）",
                :description => \
"柔らかくて、おいしいハンバーグです。

国産牛100%です。

ソースは以下から1つ選んでください。
　・デミグラスソース
　・オニオンソース
　・テリヤキソース

スープは日替わりです。")

# 画像の設定1
FoodPicture.create(:food_menus_id => "1", \
                   :pict_url => "hamburger1.jpg", \
                   :pict_alt => "ハンバーグ画像1")

# 画像の設定2
FoodPicture.create(:food_menus_id => "1", \
                   :pict_url => "hamburger2.jpg", \
                   :pict_alt => "ハンバーグ画像2")

# 画像の設定3
FoodPicture.create(:food_menus_id => "1", \
                   :pict_url => "hamburger3.jpg", \
                   :pict_alt => "ハンバーグ画像3")

############################ ハンバーグセット（終了）###########################


############################# ステーキセット（開始）############################
# 料理名、説明分の設定
FoodMenu.create(:title => "ステーキセット（ライス、スープ、ドリンク付き）",
                :description => \
"とにかくおいしいステーキです。

国産牛100%です。

ソースは以下から1つ選んでください。
　・ガーリック
　・オニオン
　・わさび醤油

スープは日替わりです。 ")

# 画像の設定1
FoodPicture.create(:food_menus_id => "2", \
                   :pict_url => "steak1.jpg", \
                   :pict_alt => "ステーキ画像1")

# 画像の設定2
FoodPicture.create(:food_menus_id => "2", \
                   :pict_url => "steak2.jpg", \
                   :pict_alt => "ステーキ画像2")

# 画像の設定3
FoodPicture.create(:food_menus_id => "2", \
                   :pict_url => "steak3.jpg", \
                   :pict_alt => "ステーキ画像3")
############################# ステーキセット（終了）############################


############################## パスタセット（開始）#############################
# 料理名、説明分の設定
FoodMenu.create(:title => "パスタセット（スープ、ドリンク付き）",
                :description => \
"おいしいです。

原料の小麦にもこだわりがあります。

ソースは以下から1つ選んでください。
　・ぺペロンチーノ
　・ミートソース
　・カルボナーラ

スープは日替わりです。")

# 画像の設定1
FoodPicture.create(:food_menus_id => "3", \
                   :pict_url => "pasta1.jpg", \
                   :pict_alt => "パスタ画像1")

# 画像の設定2
FoodPicture.create(:food_menus_id => "3", \
                   :pict_url => "pasta2.jpg", \
                   :pict_alt => "パスタ画像2")

# 画像の設定3
FoodPicture.create(:food_menus_id => "3", \
                   :pict_url => "pasta3.jpg", \
                   :pict_alt => "パスタ画像3")
############################## パスタセット（終了）#############################


####################### ドリンクの設定（開始） #################################
# アイスドリンクの設定
Drink.create(:temperature => 0, :name => "メロンソーダ"      )
Drink.create(:temperature => 0, :name => "スプライト"        )
Drink.create(:temperature => 0, :name => "コーラ"            )
Drink.create(:temperature => 0, :name => "オレンジジュース"  )
Drink.create(:temperature => 0, :name => "ウーロン茶"        )
Drink.create(:temperature => 0, :name => "アイスコーヒー"    )

# ホットドリンクの設定
Drink.create(:temperature => 1, :name => "レモンティー"      )
Drink.create(:temperature => 1, :name => "ローズヒップティー")
Drink.create(:temperature => 1, :name => "グリーンティー"    )
Drink.create(:temperature => 1, :name => "ホットコーヒー"    )
####################### ドリンクの設定（終了） #################################


####################### 予約情報の設定（開始） #################################

# ======================== レコードの生成（開始） =========================
# 予約日の初期化（予約可能日は翌日～30日以内）
set_date = Date.today + 1
after_30_date = Date.today + 30

after_3_date = Date.today + 3
# ループ1：予約日
while(set_date <= after_30_date)
#while(set_date <= after_3_date)
    # 時間の初期化（予約可能時間は11:30～20:00まで）
    set_time = Time.local(set_date.year, set_date.month, set_date.day, 11, 30, 0, 0)
    end_time = Time.local(set_date.year, set_date.month, set_date.day, 20,  0, 0, 0)
    # *****************************************************************
    # ループ2: 予約時間
    while (set_time <= end_time)
      # ------------------------------------------------------
      # ループ3:予約リストの作成（同日、同時間の予約人数は5人まで）
      for loop in 1..5 do
        # 値の設定はdate、time、reservedカラムのみ
        # 　　⇒ 他カラムは未予約状態のためnilとする
        ReserveList.create(:date => set_date, :time => set_time, :reserved => "false")
      end
      # ------------------------------------------------------
      
      # 予約人数レコードの作製（末予約状態のため、予約人数は0人）
      ReservePeople.create(:date => set_date, :time => set_time, :people => 0)
      
      set_time += 30.minute
    end
    # *****************************************************************
    
  set_date += 1
end
# ======================== レコードの生成（終了） =========================

# ======================== 予約情報の追加（開始） =========================
#                  (初期情報として何件か予を追加しておく)

# 10日後の12:00と14:00については満員（予約件数：5件）とする
after_10_date = Date.today + 2

reserve_times = [Time.local(after_10_date.year, after_10_date.month,   \
                        after_10_date.day, 12, 0, 0, 0),  # 12:00  \
                                                                   \
            Time.local(after_10_date.year, after_10_date.month,    \
                       after_10_date.day, 14, 0, 0, 0)  # 14:00    \
            ]

# 予約設定を行う5名分の名前
reserved_name = ["山田太郎", "山田花子", "木下太郎", "木下花子", "佐藤太郎"]

# レコードに予約情報を設定 
reserve_times.each do |reserve_time|
  list_records = ReserveList.where(" (date = ?) and (time = ?)", \
                                      after_10_date, reserve_time)
  # 予約リストに情報を設定                                    
  list_records.each_with_index do |list_record, loop|
    list_record.update(:name => reserved_name[loop], :phone => "090-XXXX-XXXX", \
                       :people => 2, :reserved => "true")
    puts "aaaa"
  end
  
  # 予約人数を設定(リストに5名分を登録したため5を設定)
  people_record = ReservePeople.find_by(" (date = ?) and (time = ?)", \
                                         after_10_date, reserve_time)
  people_record.update(:people => 5)
end
# ======================== 予約情報の追加（終了） =========================

####################### 予約情報の設定（開始） #################################