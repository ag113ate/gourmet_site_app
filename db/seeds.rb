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
