class CreateProjTables < ActiveRecord::Migration[5.2]

  def change

    create_table "proj.projects" do |t|
      t.string  'status'  # public or not?
      t.date    'start_date'
      t.date    'completion_date'
      t.string  'schema_name'
      t.boolean 'data_available'
      t.string  'migration_file_name'
      t.string  'name'
      t.integer 'year'
      t.string  'brief_summary'
      t.string  'investigators'
      t.string  'organizations'
      t.string  'url'
      t.text    'description'
      t.text    'protocol'
      t.text    'issues'
      t.text    'study_selection_criteria'
      t.string  'submitter_name'
      t.string  'contact_info'
      t.string  'contact_url'
      t.string  'email'
      t.binary  'image'
      t.timestamps null: false
    end

    create_table "proj.datasets" do |t|
      t.integer 'project_id'
      t.string  'schema_name'
      t.string  'table_name'
      t.string  'dataset_type'   # results, included_studies, statistics
      t.string  'file_name'
      t.string  'content_type'  # image, spreadsheet, etc
      t.string  'name'
      t.binary  'file_contents'
      t.string  'url'
      t.date    'made_available_on'
      t.text    'description'
      t.timestamps null: false
    end

    create_table "proj.attachments" do |t| # other types of files (not datasets) like images and text reports
      t.integer 'project_id'
      t.string  'file_name'
      t.string  'content_type'  # image, spreadsheet, etc
      t.binary  'file_contents'
      t.boolean 'is_image'
      t.text    'description'
      t.string  'original_file_name'
      t.timestamps null: false
    end

    create_table "proj.publications" do |t|
      t.integer 'project_id'
      t.string 'pub_type'
      t.string 'journal_name'
      t.string 'title'
      t.string 'url'
      t.string 'citation'
      t.date   'publication_date'
      t.text   'abstract'
      t.timestamps null: false
    end

    create_table 'proj.data_definitions' do |t|
      t.string  'schema_name'
      t.string 'table_name'
      t.string 'column_name'
      t.string 'category'
      t.string 'label'
      t.string 'data_type'
      t.string 'source'
      t.text   'description'
      t.string 'nlm_link'
      t.json   'enumerations'
      t.timestamps null: false
    end

    add_index "proj.projects", :data_available
    add_index "proj.projects", :investigators
    add_index "proj.projects", :organizations
    add_index "proj.projects", :start_date
    add_index "proj.projects", :completion_date
    add_index "proj.projects", :year

  end

end
