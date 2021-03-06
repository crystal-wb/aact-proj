module ProjCdekStandardOrgs
  class CdekSynonym < ActiveRecord::Base
    self.table_name = 'proj_cdek_standard_orgs.cdek_synonyms'

    def self.populate
      file_name="#{Rails.public_path}/attachments/proj_cdek_standard_orgs_synonyms.xlsx"
      self.populate_from_file(file_name)
    end

    def self.populate_from_file(file_name)
      connection.execute("TRUNCATE TABLE #{table_name};")
      data = Roo::Spreadsheet.open(file_name).sheet("Synonyms")
      header = data.first.compact.map(&:downcase)

      (2..data.last_row).each  {|i|
        row = Hash[[header, data.row(i)].transpose]
        create(
          :name                      => row['name'].strip,
          :downcase_name             => row['name'].downcase.strip,
          :preferred_name            => (row['preferred_name'] if row['preferred_name']),
          :downcase_preferred_name   => (row['preferred_name'].downcase.strip if row['preferred_name'])
        ).save!  if !row['name'].blank?
      }
    end

  end
end
