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

ActiveRecord::Schema.define(version: 20150212013708) do

  create_table "assessment_discs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assessment_skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assessment_values", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disc_assessments", force: true do |t|
    t.integer  "user_id"
    t.integer  "driver_score"
    t.integer  "influencer_score"
    t.integer  "sociable_score"
    t.integer  "conscientious_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_time"
  end

  add_index "disc_assessments", ["user_id"], name: "index_disc_assessments_on_user_id"

  create_table "job_benchmarks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_discs", force: true do |t|
    t.integer  "assessment_disc_id"
    t.integer  "job_posting_id"
    t.integer  "job_benchmark_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_discs", ["assessment_disc_id"], name: "index_job_discs_on_assessment_disc_id"
  add_index "job_discs", ["job_benchmark_id"], name: "index_job_discs_on_job_benchmark_id"
  add_index "job_discs", ["job_posting_id"], name: "index_job_discs_on_job_posting_id"

  create_table "job_postings", force: true do |t|
    t.integer  "job_benchmark_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "task_01"
    t.string   "task_02"
    t.string   "task_03"
    t.string   "task_04"
    t.string   "task_05"
    t.string   "task_06"
    t.string   "task_07"
    t.string   "task_08"
    t.string   "task_09"
    t.string   "task_10"
    t.string   "task_11"
    t.string   "task_12"
    t.string   "task_13"
    t.string   "task_14"
    t.string   "task_15"
  end

  add_index "job_postings", ["job_benchmark_id"], name: "index_job_postings_on_job_benchmark_id"
  add_index "job_postings", ["user_id"], name: "index_job_postings_on_user_id"

  create_table "job_skills", force: true do |t|
    t.integer  "assessment_skill_id"
    t.integer  "job_posting_id"
    t.integer  "job_benchmark_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_skills", ["assessment_skill_id"], name: "index_job_skills_on_assessment_skill_id"
  add_index "job_skills", ["job_benchmark_id"], name: "index_job_skills_on_job_benchmark_id"
  add_index "job_skills", ["job_posting_id"], name: "index_job_skills_on_job_posting_id"

  create_table "job_tasks", force: true do |t|
    t.integer  "task_statement_id"
    t.integer  "job_benchmark_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_tasks", ["job_benchmark_id"], name: "index_job_tasks_on_job_benchmark_id"
  add_index "job_tasks", ["task_statement_id"], name: "index_job_tasks_on_task_statement_id"

  create_table "job_values", force: true do |t|
    t.integer  "assessment_value_id"
    t.integer  "job_posting_id"
    t.integer  "job_benchmark_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_values", ["assessment_value_id"], name: "index_job_values_on_assessment_value_id"
  add_index "job_values", ["job_benchmark_id"], name: "index_job_values_on_job_benchmark_id"
  add_index "job_values", ["job_posting_id"], name: "index_job_values_on_job_posting_id"

  create_table "messages", force: true do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "job_posting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["job_posting_id"], name: "index_messages_on_job_posting_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "task_statements", force: true do |t|
    t.string   "onet_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
