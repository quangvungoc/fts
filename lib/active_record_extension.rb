module ActiveRecordExtension
  require 'csv'
  require 'iconv'

  extend ActiveSupport::Concern

  module ClassMethods
    def to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |object|
          csv << object.attributes.values_at(*column_names)
        end
      end
    end

    def import(file)
      spreadsheet = CSV.read(file.path, {headers: true})
      headers = spreadsheet.headers

      spreadsheet.each do |row|
        object = find_by_id(row["id"]) || new(row.to_hash)
        object.save!
      end
    end

  end
end


ActiveRecord::Base.send(:include, ActiveRecordExtension)