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

ActiveRecord::Schema.define(version: 20170529012843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "farmacia", force: :cascade do |t|
    t.string   "nombre"
    t.string   "cedulaJur"
    t.string   "sucursal"
    t.string   "direccion"
    t.string   "correo"
    t.integer  "telefono1"
    t.integer  "telefono2"
    t.string   "latitud"
    t.string   "longitud"
    t.integer  "cant_lab"
    t.boolean  "activo"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "laboratorios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "plan_pacientes", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "laboratorio_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "plan_pacientes", ["laboratorio_id"], name: "index_plan_pacientes_on_laboratorio_id", using: :btree

  create_table "presentacions", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "sustancium_id"
    t.integer  "presentacion_id"
    t.string   "oferta"
    t.integer  "laboratorio_id"
    t.integer  "plan_paciente_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "productos", ["laboratorio_id"], name: "index_productos_on_laboratorio_id", using: :btree
  add_index "productos", ["plan_paciente_id"], name: "index_productos_on_plan_paciente_id", using: :btree
  add_index "productos", ["presentacion_id"], name: "index_productos_on_presentacion_id", using: :btree
  add_index "productos", ["sustancium_id"], name: "index_productos_on_sustancium_id", using: :btree

  create_table "sustancia", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_plans", force: :cascade do |t|
    t.string   "tipo"
    t.string   "descripcion"
    t.integer  "plan_paciente_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "tipo_plans", ["plan_paciente_id"], name: "index_tipo_plans_on_plan_paciente_id", using: :btree

  add_foreign_key "plan_pacientes", "laboratorios"
  add_foreign_key "productos", "laboratorios"
  add_foreign_key "productos", "plan_pacientes"
  add_foreign_key "productos", "presentacions"
  add_foreign_key "productos", "sustancia"
  add_foreign_key "tipo_plans", "plan_pacientes"
end
