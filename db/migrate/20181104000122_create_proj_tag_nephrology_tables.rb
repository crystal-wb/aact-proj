class CreateProjTagNephrologyTables < ActiveRecord::Migration[5.2]

  def up
    execute "CREATE SCHEMA IF NOT EXISTS proj_tag_nephrology;"
    # set search path so that this doesn't get confused about other schemas

    create_table "proj_tag_nephrology.tagged_terms" do |t|
      t.integer 'project_id'
      t.string  'identifier'
      t.string  'tag'
      t.string  'term'
      t.string  'year'
      t.string  'term_type'
    end

    create_table "proj_tag_nephrology.analyzed_studies" do |t|
      t.string  'nct_id'
      t.string  'brief_title'
      t.string  'keywords'
      t.string  'conditions'
      t.string  'mesh_terms'
    end

    add_index 'proj_tag_nephrology.tagged_terms', :identifier
    add_index 'proj_tag_nephrology.tagged_terms', :term
    add_index 'proj_tag_nephrology.tagged_terms', :tag
    add_index 'proj_tag_nephrology.tagged_terms', :term_type

    execute <<-SQL
      CREATE OR REPLACE VIEW proj_tag_nephrology.current_tagged_studies AS
      select distinct * from studies where nct_id in (
        select s.nct_id
        from studies s, browse_conditions bc
        where s.study_type='Interventional'
        and s.study_first_posted_date > '2007-10-01'
        and s.nct_id = bc.nct_id
        and bc.downcase_mesh_term IN (select term from proj_tag_nephrology.tagged_terms)
        union
        select s.nct_id
        from studies s, keywords k
        where s.study_type='Interventional'
        and s.study_first_posted_date > '2007-10-01'
        and s.nct_id = k.nct_id
        and k.downcase_name IN (select term from proj_tag_nephrology.tagged_terms)
        union
        select s.nct_id
        from studies s, conditions c
        where s.study_type='Interventional'
        and s.study_first_posted_date > '2007-10-01'
        and s.nct_id = c.nct_id
        and c.downcase_name IN (select term from proj_tag_nephrology.tagged_terms)
      );
    SQL
  end

  def down
    drop_table proj_tag_nephrology.tagged_terms;
    execute "DROP SCHEMA IF EXISTS proj_tag_nephrology;"
  end

end
