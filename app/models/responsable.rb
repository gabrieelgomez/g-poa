# Responsable Model
class Responsable < ActiveRecord::Base
  include ActivityHistory
  include CloneRecord
  require 'csv'
  acts_as_list

  belongs_to :operative_plan
  has_and_belongs_to_many :responsables

  # Fields for the search form in the navbar
  def self.search_field
    fields = ["name", "email", "age"]
    build_query(fields, :or, :cont)
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      begin
        self.create! row.to_hash
      rescue => err
      end
    end
  end

  def self.sorter(params)
    params.each_with_index do |id, idx|
      self.find(id).update(position: idx.to_i+1)
    end
  end

  # Funcion para armar el query de ransack
  def self.build_query(fields, operator, conf)
    query = fields.join("_#{operator}_")
    query << "_#{conf}"
    query.to_sym
  end
end
