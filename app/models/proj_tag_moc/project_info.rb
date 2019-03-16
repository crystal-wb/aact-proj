module ProjTagMoc
  class ProjectInfo

    def self.meta_info
      #  Required:  name, schema_name & migration_file_name
      { name:                'Characteristics of Clinical Trials Registered in ClinicalTrials.gov, 2007-2010',
        schema_name:         'proj_tag_moc',
        migration_file_name:  Rails.root.join('db','migrate','20190307000122_create_proj_tag_moc_tables.rb').to_s,
        investigators:       'Robert M. Califf, MD; Deborah A. Zarin, MD; Judith M. Kramer, MD, MS; Rachel E. Sherman, MD, MPH; Laura H. Aberle, BSPH; Asba Tasneem, PhD',
        organizations:       'Duke Clinical Research Institute',
        contact_info:        '',
        contact_url:         '',
        data_available:      true,
        aact_version:        'September 27, 2010',
        start_date:          Date.strptime('27/09/2010', '%d/%m/%Y'),
        year:                2012,
        url:                 'https://jamanetwork.com/journals/jama/fullarticle/1150093',
        email:               '',
        brief_summary:       'The objective was to examine fundamental characteristics of interventional clinical trials registered in the ClinicalTrials.gov database.',
        description:         'This project used ClinicalTrials.gov data to conduct a comprehensive evaluation of mental health, cardiovascular and oncology studies that were entered between September 2007 & 2010 to identify trends and patterns.',
        study_selection_criteria: "Our analysis was restricted to interventional studies registered with ClinicalTrials.gov between October 2007 and September 2010. To identify interventional studies, we used studies.study_type which provides the following choices: interventional, observational, expanded access, and not available (NA). Interventional studies were regrouped within the downloaded, derivative database according to the 3 clinical specialties—cardiovascular, oncology, and mental health. For this regrouping, we used submitted disease condition terms and Medical Subject Heading (MeSH) terms generated by a National Library of Medicine (NLM) algorithm to develop a methodology to annotate, validate, adjudicate, and implement disease condition terms (MeSH and non-MeSH) to create specialty data sets.

A subset of the 2010 MeSH thesaurus from the NLM21 and a list of non-MeSH disease condition terms provided by data submitters that appeared in 5 or more interventional studies in the analysis data set were reviewed and annotated by clinical specialists at Duke University Medical Center. Terms were annotated according to their relevance to a given specialty (Y = relevant, N = not relevant). Specialty data sets were created and the results of algorithmic classifications were validated by comparison with classifications based on manual review. Clinical trials were classed according to date registered and by interventional status.",
      }
    end

    def self.publications
      [
        {
          journal_name:     'JAMA',
          publication_date: Date.strptime('05/02/2012', '%d/%m/%Y'),
          pub_type:         'AcademicArticle',
          pmid:             '22550198',
          pmcid:            '',
          doi:              '10.1001/jama.2012.3424',
          title:            'Characteristics of Clinical Trials Registered in ClinicalTrials.gov, 2007-2010',
          url:              'https://jamanetwork.com/journals/jama/fullarticle/1150093',
          citation:         'Califf RM, Zarin DA, Kramer JM, Sherman RE, Aberle LH, Tasneem A. Characteristics of clinical trials registered in ClinicalTrials. gov, 2007-2010. Jama. 2012 May 2;307(17):1838-47.'
        }
      ]
    end

    def self.attachments
      [
        {
          description: 'Data Definitions',
          file_name:   "#{Rails.public_path}/attachments/proj_tag_moc_data_defs.xlsx",
          file_type: 'application/vnd.openxmlformats-officedocument.spreads'
        },
      ]
    end

    def self.datasets
      [
        {
          dataset_type: 'study list',
          schema_name:  'proj_tag_moc',
          table_name:   'analyzed_studies',
          name:         'Analyzed Studies',
          file_name:    "#{Rails.public_path}/attachments/proj_tag_moc_studies.xlsx",
          file_type:    'application/vnd.openxmlformats-officedocument.spreads',
          description:  "",
          source:       "Trials selected from AACT that are indentified as having focused on one of three clinical specialties: cardiovascular, mental health, and/or oncology and registered in ClinicalTrials.gov between September, 2007 and September 27, 2010. (These three clinical specialties together encompass the largest number of disability-adjusted life-years lost in the United States)."
        },
        {
          dataset_type: 'terms',
          schema_name:  'proj_tag_moc',
          table_name:   'tagged_terms',
          name:         'Mental Health, Oncology and Cardiovascular Terms (MeSH & Free Text)',
          file_name:    "#{Rails.public_path}/attachments/proj_tag_moc_terms.xlsx",
          file_type:    'application/vnd.openxmlformats-officedocument.spreads',
          description:  '',
          source:       'The MeSH terms are those from the 2010 MeSH thesaurus branches C, E, F, G that relate to either mental health, oncology or cardiovascular conditions. The free text terms are those related to one of these 3 specialties that occurred in AACT(2010).conditions field with frequency >=5 among interventional studies registered on or after Oct 1, 2007, and that did not exist in MeSH thesaurus.'
        }
      ]
    end

    def self.load_project_tables
      ProjTagMoc::TaggedTerm.populate
      ProjTagMoc::CardiovascularStudy.populate
      ProjTagMoc::MentalHealthStudy.populate
      ProjTagMoc::OncologyStudy.populate
    end

  end
end