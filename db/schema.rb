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

ActiveRecord::Schema.define(version: 20170706035846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disponibilidads", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farmacia", force: :cascade do |t|
    t.string   "nombre"
    t.string   "cedulaJur"
    t.string   "sucursal"
    t.string   "direccion"
    t.integer  "telefono1"
    t.integer  "telefono2"
    t.string   "latitud"
    t.string   "longitud"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "password_digest"
    t.string   "correo"
    t.boolean  "verificado",         default: false
    t.boolean  "activo",             default: true
    t.integer  "cant_lab",           default: 5
  end

  create_table "lab_fars", force: :cascade do |t|
    t.integer  "farmacium_id"
    t.integer  "laboratorio_id"
    t.boolean  "activo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "lab_fars", ["farmacium_id"], name: "index_lab_fars_on_farmacium_id", using: :btree
  add_index "lab_fars", ["laboratorio_id"], name: "index_lab_fars_on_laboratorio_id", using: :btree

  create_table "laboratorios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "activo",      default: true
  end

  create_table "plan_pacientes", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "laboratorio_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "activo",         default: true
  end

  add_index "plan_pacientes", ["laboratorio_id"], name: "index_plan_pacientes_on_laboratorio_id", using: :btree

  create_table "presentacions", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "activo",      default: true
  end

  create_table "pro_fars", force: :cascade do |t|
    t.integer  "farmacium_id"
    t.integer  "producto_id"
    t.integer  "disponibilidad_id"
    t.boolean  "activo"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "pro_fars", ["disponibilidad_id"], name: "index_pro_fars_on_disponibilidad_id", using: :btree
  add_index "pro_fars", ["farmacium_id"], name: "index_pro_fars_on_farmacium_id", using: :btree
  add_index "pro_fars", ["producto_id"], name: "index_pro_fars_on_producto_id", using: :btree

  create_table "productos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "presentacion_id"
    t.string   "oferta"
    t.integer  "laboratorio_id"
    t.integer  "plan_paciente_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "sustancium_id"
    t.boolean  "activo",           default: true
  end

  add_index "productos", ["laboratorio_id"], name: "index_productos_on_laboratorio_id", using: :btree
  add_index "productos", ["plan_paciente_id"], name: "index_productos_on_plan_paciente_id", using: :btree
  add_index "productos", ["presentacion_id"], name: "index_productos_on_presentacion_id", using: :btree
  add_index "productos", ["sustancium_id"], name: "index_productos_on_sustancium_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sustancia", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "activo",      default: true
  end

  create_table "tipo_plans", force: :cascade do |t|
    t.string   "tipo"
    t.string   "descripcion"
    t.integer  "plan_paciente_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "tipo_plans", ["plan_paciente_id"], name: "index_tipo_plans_on_plan_paciente_id", using: :btree

  add_foreign_key "lab_fars", "farmacia"
  add_foreign_key "lab_fars", "laboratorios"
  add_foreign_key "plan_pacientes", "laboratorios"
  add_foreign_key "pro_fars", "disponibilidads"
  add_foreign_key "pro_fars", "farmacia"
  add_foreign_key "pro_fars", "productos"
  add_foreign_key "productos", "laboratorios"
  add_foreign_key "productos", "plan_pacientes"
  add_foreign_key "productos", "presentacions"
  add_foreign_key "productos", "sustancia"
  add_foreign_key "tipo_plans", "plan_pacientes"
end
