module ProjTag
  class AnalyzedFreeTextTerm < ActiveRecord::Base

    def self.populate
      dir="#{Rails.public_path}/csv/"
      file_names=Dir.entries(dir).select { |fn|
        (fn.include? 'analyzed_free_text_terms.xlsx') and fn[0] != '~'
      }
      file_names.each { |file_name|
        self.populate_from_file("#{dir}/#{file_name}")
      }
    end

    def self.populate_from_file(file_name)
      data = Roo::Spreadsheet.open(file_name)
      year = file_name.split('/').last.split('_').first
      header = data.first.map(&:downcase)
      puts "  >> #{data.last_row} analyzed free text terms for #{year}"

      (2..data.last_row).each { |i|
        row = Hash[[header, data.row(i)].transpose]
        if !row['name'].nil?
          categories= row.map{|key,value| key if ['y','x'].include? value.try(:downcase) }.reject(&:blank?)
          if !categories.empty?
            new(:identifier    => row['name'].downcase,
                :term          => row['name'],
                :downcase_term => row['name'].downcase,
            ).save
          end

          categories.each { |cat|
            ProjTag::CategorizedTerm.create(
              :project_id   => '1',
              :identifier   => row['name'].downcase,
              :category     => cat,
              :term         => row['name'].downcase,
              :year         => year,
              :term_type    => 'free',
            ).save!
          }
        end
      }
    end

  end
end
