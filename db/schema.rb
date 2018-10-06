# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181006210853) do

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "denominateur"
    t.string "color"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.boolean "prolongations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "image_une_url"
    t.integer "tournament_id"
    t.string "mode"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "pseudo"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "win", default: 0
    t.integer "win_prol", default: 0
    t.integer "win_peno", default: 0
    t.integer "lose", default: 0
    t.integer "lose_prol", default: 0
    t.integer "lose_peno", default: 0
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points", default: 0
    t.integer "win", default: 0
    t.integer "win_prol", default: 0
    t.integer "win_peno", default: 0
    t.integer "lose", default: 0
    t.integer "lose_prol", default: 0
    t.integer "lose_peno", default: 0
    t.integer "tournament_id"
    t.integer "draw", default: 0
    t.index ["player_id"], name: "index_seasons_on_player_id"
    t.index ["tournament_id"], name: "index_seasons_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.integer "prol_score"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
    t.integer "club_id"
    t.string "status"
    t.integer "season_id"
    t.index ["club_id"], name: "index_teams_on_club_id"
    t.index ["match_id"], name: "index_teams_on_match_id"
    t.index ["player_id"], name: "index_teams_on_player_id"
    t.index ["season_id"], name: "index_teams_on_season_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "win_regular_points"
    t.integer "win_prol_points"
    t.integer "win_peno_points"
    t.integer "lose_regular_points"
    t.integer "lose_prol_points"
    t.integer "lose_peno_points"
    t.integer "draw_regular_points"
    t.boolean "finished"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
