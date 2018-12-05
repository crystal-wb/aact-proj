module ProjCdekStandardOrgs
  class ProjectInfo

    def self.meta_info
    {
     name:           'CDEK’s Standard Organization Names',
     schema_name:    'proj_cdek_standard_orgs',
     migration_file_name:  Rails.root.join('db','migrate','20181108000122_create_proj_cdek_standard_orgs_tables.rb').to_s,
     brief_summary:  'The CDEK project at Washington University has curated organization data to standardize terminology.',
     investigators:  'Rebekah Griesenauer, PhD, Postdoctoral Scholar; Michael S Kinch, PhD, Associate Vice Chancellor',
     organizations:  'Washington University - St. Louis. Center for Research Innovation and Biotechnology',
     contact_info:   'CDEK was developed and is maintained by the Center for Research Innovation in Biotechnology 374 (CRIB) at Washington University in St. Louis. CRIB studies the blend of science, business, and 375 regulation of biotechnology, medical devices, and healthcare IT to ensure continued improvements 376 in the delivery of medical innovations and public health. CRIB is actively pursuing collaborations to 377 study the data within CDEK. Errors and suggestions for improvement can be submitted at 378 http://cdek.wustl.edu/about/. Or contact us via e-mail at cdek at wustl dot edu.',
     contact_url:    'http://cdek.wustl.edu/about/',
     data_available: true,
     start_date:     Date.strptime('27/09/2016', '%d/%m/%Y'),
     year:           2018,
     description:   ' Clinical Drug Experience Knowledgebase (CDEK) is a database and web-platform to enable researchers and analysts to study all active pharmaceutical ingredients with evidence of clinical experience in humans. CDEK contains over 20,000 active pharmaceutical ingredients with surrounding annotated metadata (i.e. sponsoring organizations, indications, clinical trial data, chemical structure, etc). We curated CDEK in part by disambiguating intervention and organization names from ClinicalTrials.gov (through AACT). This information was cross-referenced against entries in prominent international drug databases (e.g. PubChem, ChEMBL, DrugBank). We have a prototype web-application designed to allow researchers of all backgrounds to access and query the data (cdek.wustl.edu).'
     }
    end

    def self.publications
      [{
        journal_name:     'BioRxiv  The Preprint Server for Biology',
        publication_date: Date.strptime('11/19/2018', '%m/%d/%Y'),
        pub_type:         'AcademicArticle',
        title:            'CDEK: Clinical Drug Experience Knowledgebase',
        url:              'http://dx.doi.org/10.1101/474189',
        doi:              '10.1101/474189',
        citation:         'Griesenauer R, Schillebeeck C, Kinch MS. CDEK: Clinical Drug Experience Knowledgebase. bioRxiv  The Preprint Server for Biology. 2018 November 19'
      }]
    end

    def self.datasets
      [
        {
          dataset_type: 'terms',
          schema_name:  'proj_cdek_standard_orgs',
          table_name:   'cdek_organizations',
          name:         'CDEK Standardized Organization Names',
          file_name:    "#{Rails.public_path}/attachments/proj_cdek_standard_orgs_organizations.xlsx",
          file_type:    'application/vnd.openxmlformats-officedocument.spreads'
        },
        {
          dataset_type: 'links',
          schema_name:  'proj_cdek_standard_orgs',
          table_name:   'cdek_synonyms',
          name:         'CDEK Organization Synonyms',
          file_name:    "#{Rails.public_path}/attachments/proj_cdek_standard_orgs_synonyms.xlsx",
          file_type:    'application/vnd.openxmlformats-officedocument.spreads'
        },
      ]
    end

    def self.attachments
      []
    end

    def self.load_project_tables
      ProjCdekStandardOrgs::CdekOrganization.populate
      ProjCdekStandardOrgs::CdekSynonym.populate
    end

  end
end
