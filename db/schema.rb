# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140926120304) do

  create_table "attachments", force: true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "attachments", ["attachable_id"], name: "index_attachments_on_attachable_id"

  create_table "labelings", force: true do |t|
    t.integer  "label_id"
    t.integer  "labelable_id"
    t.string   "labelable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "labelings", ["label_id", "labelable_id", "labelable_type"], name: "unique_labeling_label", unique: true
  add_index "labelings", ["label_id"], name: "index_labelings_on_label_id"
  add_index "labelings", ["labelable_id", "labelable_type"], name: "index_labelings_on_labelable_id_and_labelable_type"

  create_table "labels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
  end

  create_table "notifications", force: true do |t|
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["notifiable_id", "notifiable_type", "user_id"], name: "unique_notification", unique: true
  add_index "notifications", ["notifiable_id", "notifiable_type"], name: "index_notifications_on_notifiable_id_and_notifiable_type"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "replies", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.string   "message_id"
    t.string   "content_type", default: "html"
  end

  add_index "replies", ["message_id"], name: "index_replies_on_message_id"
  add_index "replies", ["ticket_id"], name: "index_replies_on_ticket_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"

  create_table "rules", force: true do |t|
    t.string   "filter_field"
    t.integer  "filter_operation", default: 0, null: false
    t.string   "filter_value"
    t.integer  "action_operation", default: 0, null: false
    t.string   "action_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assignee_id"
    t.string   "message_id"
    t.integer  "user_id"
    t.string   "content_type", default: "html"
    t.integer  "status",       default: 0,      null: false
    t.integer  "priority",     default: 0,      null: false
  end

  add_index "tickets", ["assignee_id"], name: "index_tickets_on_assignee_id"
  add_index "tickets", ["message_id"], name: "index_tickets_on_message_id"
  add_index "tickets", ["priority"], name: "index_tickets_on_priority"
  add_index "tickets", ["status"], name: "index_tickets_on_status"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "agent"
    t.text     "signature"
    t.boolean  "notify",                 default: true
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
