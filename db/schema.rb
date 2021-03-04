# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_04_035718) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "actor_countries", force: :cascade do |t|
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "actor_genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "actor_gender_id", null: false
    t.integer "actor_country_id", null: false
    t.index ["actor_country_id"], name: "index_actors_on_actor_country_id"
    t.index ["actor_gender_id"], name: "index_actors_on_actor_gender_id"
  end

  create_table "actors_videos", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_actors_videos_on_actor_id"
    t.index ["video_id"], name: "index_actors_videos_on_video_id"
  end

  create_table "content_ratings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres_videos", id: false, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "video_id", null: false
    t.index ["genre_id", "video_id"], name: "index_genres_videos_on_genre_id_and_video_id"
    t.index ["video_id", "genre_id"], name: "index_genres_videos_on_video_id_and_genre_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.float "price"
    t.integer "total_copies"
    t.string "barcode_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "video_id", null: false
    t.integer "media_type_id", null: false
    t.index ["media_type_id"], name: "index_inventories_on_media_type_id"
    t.index ["video_id"], name: "index_inventories_on_video_id"
  end

  create_table "media_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movie_stocks", force: :cascade do |t|
    t.boolean "is_rented"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "inventory_id", null: false
    t.index ["inventory_id"], name: "index_movie_stocks_on_inventory_id"
  end

  create_table "user_levels", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.integer "user_level_id", null: false
    t.index ["user_level_id"], name: "index_users_on_user_level_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "content_rating_id", null: false
    t.string "thumbnail_file_name"
    t.string "thumbnail_content_type"
    t.integer "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.index ["content_rating_id"], name: "index_videos_on_content_rating_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "actors", "actor_countries"
  add_foreign_key "actors", "actor_genders"
  add_foreign_key "actors_videos", "actors"
  add_foreign_key "actors_videos", "videos"
  add_foreign_key "inventories", "media_types"
  add_foreign_key "inventories", "videos"
  add_foreign_key "movie_stocks", "inventories"
  add_foreign_key "users", "user_levels"
  add_foreign_key "videos", "content_ratings"
end
