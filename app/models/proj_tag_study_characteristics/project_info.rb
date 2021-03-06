module ProjTagStudyCharacteristics
  class ProjectInfo < ProjectInfoTemplate

    def self.meta_info
      { name:                'Characteristics of Clinical Trials Registered in ClinicalTrials.gov, 2007-2010',
        schema_name:         'proj_tag_study_characteristics',
        migration_file_name:  Rails.root.join('db','migrate','20190307000122_create_proj_tag_study_characteristics_tables.rb').to_s,
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
        description:         'This project used ClinicalTrials.gov data to summarize characeristics of 40,970 interventional trials registered between October 2007 and September 2010.  Characteristics were compared between trials in three clinical specialties: mental health, cardiovascular and oncology.',
        study_selection_criteria: "Our analysis was restricted to interventional studies registered with ClinicalTrials.gov between October 2007 and September 2010. To identify interventional studies, we used studies.study_type which provides the following choices: interventional, observational, expanded access, and not available (NA). Interventional studies were regrouped within the downloaded, derivative database according to the 3 clinical specialties—cardiovascular, oncology, and mental health. For this regrouping, we used submitted disease condition terms and Medical Subject Heading (MeSH) terms generated by a National Library of Medicine (NLM) algorithm to develop a methodology to annotate, validate, adjudicate, and implement disease condition terms (MeSH and non-MeSH) to create specialty data sets.

A subset of the 2010 MeSH thesaurus from the NLM and a list of non-MeSH (free text) disease condition terms provided by data submitters that appeared in 5 or more interventional studies in the analysis data set were reviewed and annotated by clinical specialists at Duke University Medical Center. Terms were annotated according to their relevance to a given specialty (Y = relevant, N = not relevant). Cardiovascular(N=3437), oncology (N=8992), and mental health (N=3695)studies were identified by searching for relevant MeSH and free text terms in the submitted conditions field, as well the condition MeSH terms generated for each study by the NLM. Because MeSH terms can exist with multiple MeSH IDs in the MeSH thesaurus and relevance to a clinical specialty may depend on the context, only MeSH terms that were consistently coded as relevant (Y) across all MeSH IDs met the criteria for inclusion in this analysis. A single study may have multiple MeSH and/or condition terms, and studies were included if they had one or more terms relevant to the clinical specialty of interest. A study could be included in more than one specialty. The results of these specialty classifications based on searches for relevant terms were validated by comparison with classifications based on manual review. (Tasneem A, Aberle L, Ananth H, et al. The database for Aggregate Analysis of ClinicalTrials.gov (AACT) and subsequent regrouping by clinical specialty. PLoS One. 2012;7(3):e33677.)",
      }
    end

    def self.faqs
      [
        {
          question:   'How were terms reviewed & assigned to the three clinical specialties (mental health, oncology & cardiovascular)?',
          answer:     'Terms in four high-level branches of the 2010 MeSH thesaurus (branches C, E, F, G, 18491 records in total) were reviewed by clinicians (MDs) with subject matter expertise. Terms relevant to cardiovascular disease, mental health, and oncology were identified, and tagged as Y if relevant to each disease area and N if not. Terms were reviewed by two independent clinicians from each specialty. Disagreements were adjudicated by a third reviewer. Terms were tagged in the context of the MeSH tree, which could lead to a particular MeSH term having both Y and N tags, depending on the record’s location in the tree hierarchy. Clinical reviewers were given an opportunity to reconcile the tagging of such terms. Since not all studies had MeSH condition terms, clinicians also reviewed non-MeSH terms from the Conditions field that occurred in 5 or more studies meeting inclusion criteria (interventional studies registered between October 2007-September 2010). These 1220 non-MeSH (free text) condition terms were also tagged as Y if relevant to each disease area, and N if not.',
          citation:   'Tasneem A, Aberle L, Ananth H, Chakraborty S, Chiswell K, et al. (2012) The Database for Aggregate Analysis of ClinicalTrials.gov (AACT) and Subsequent Regrouping by Clinical Specialty. PLoS ONE 7(3): e33677. doi:10.1371/journal.pone.0033677)',
          url:      'https://www.ctti-clinicaltrials.org/files/clinicaltrials.gov-methodspaper.pdf',
        },
        {
          question:   'How were tagged terms used to identify the mental health, oncology & cardiovascular studies reported in this manuscript? ',
          answer:     'For each disease area, we searched for studies with relevant MeSH and free text condition terms, i.e., terms that were tagged as Y. We searched for these terms in the submitted Conditions field (which contains condition terms provided by data submitters) as well as in the Browse_Conditions field (which contains additional MeSH condition terms generated for each study by the National Library of Medicine). For this manuscript, we only searched for MeSH terms that were consistently tagged as Y at all locations in the MeSH tree. Terms that were tagged as Y at some locations and N at others were excluded from our search. These excluded terms are listed on the ‘Ambiguous Terms’ tab of the Excel file, proj_tag_study_characteristics_terms.xlsx. A study was included in a disease group (e.g., cardiovascular) if it included at least one term tagged as relevant to that disease. A study could be grouped into more than one disease (e.g., cardiovascular and oncology) if it had condition terms tagged as relevant to both diseases.',
          citation:   'Tasneem A, Aberle L, Ananth H, Chakraborty S, Chiswell K, et al. (2012) The Database for Aggregate Analysis of ClinicalTrials.gov (AACT) and Subsequent Regrouping by Clinical Specialty. PLoS ONE 7(3): e33677. doi:10.1371/journal.pone.0033677)',
          url:      'https://www.ctti-clinicaltrials.org/files/clinicaltrials.gov-methodspaper.pdf',
        },
        {
          question:   'Can I use the terms tagged for this project to search for relevant studies in the current version of AACT?',
          answer:     'Yes. However, we recommend that you follow these steps before re-using the tagged terms.

Carefully review the tagged terms and the manuscript methods to make sure that the selected terms are relevant to the purpose of your own study. For example, your study may need to use a more/less specific set of terms, depending on your goal, and the risks of false positives and false negatives that are acceptable for your study.
Update the tagging to the most recent data. The MeSH thesaurus changes over time, so you will need to check for terms that are in the current / relevant MeSH thesaurus that were not included in the 2010 version. Similarly, the list of free text condition terms that were reviewed for this project were those that occurred in 5 or more interventional studies registered between October 2007-September 2010. Depending on the inclusion criteria for your study set, you may need to check if there are additional frequently-occurring free text terms.
When searching studies for relevant MeSH and free text terms, consider allowing for minor differences in character strings. For example, convert character strings to lower case to avoid missing terms with differences in capitalization. Fuzzy searches (e.g., that allow for differences in punctuation, or other minor differences) may be helpful.',
        },
        {
          question:   'If I search for studies in AACT using the terms tagged for this project, will I get the same results as using the search tools at ClinicalTrials.gov.',
          answer:     'Probably not. The search tools at ClinicalTrials.gov (e.g., the Advanced Search), search across various fields and also look for synonyms, and will likely return a much wider set of studies than you would get if you searched just for a particular term in the Conditions and Browse_Conditions fields in AACT.',
        },
      ]
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
          file_name:   "#{Rails.public_path}/attachments/proj_tag_study_characteristics_data_defs.xlsx",
          file_type: 'application/vnd.openxmlformats-officedocument.spreads'
        },
      ]
    end

    def self.datasets
      [
        {
          dataset_type: 'study list',
          schema_name:  'proj_tag_study_characteristics',
          name:         'Analyzed Studies',
          file_name:    "#{Rails.public_path}/attachments/proj_tag_study_characteristics_studies.xlsx",
          file_type:    'application/vnd.openxmlformats-officedocument.spreads',
          description:  "This 4-page spreadsheet identifies all studies that were analyzed in this investigation. The NCT ID, brief title and lead sponsor are the data elements provided. The first page of the spreadsheet lists all studies with three yes/no columns to indicate which of the three clinical specialties each study belongs. Three additional pages are included that list studies by clinical specialty. The AACT database provides this information in three tables in the proj_tag_study_characteristics schema, one table per clinical specialty: mental_health_studies, oncology_studies and cardiovascular_studies. You can use the NCT ID to join to current study information available in the ctgov schema. (It should be noted that information may have been updated since this investigation concluded.)",
          source:       "Trials selected from AACT that are indentified as having focused on one of three clinical specialties: cardiovascular, mental health, and/or oncology and registered in ClinicalTrials.gov between September, 2007 and September 27, 2010. (These three clinical specialties together encompass the largest number of disability-adjusted life-years lost in the United States)."
        },
        {
          dataset_type: 'terms',
          schema_name:  'proj_tag_study_characteristics',
          table_name:   'tagged_terms',
          name:         'Analyzed MeSH & Free Text Terms & Those Associated with Mental Health, Oncology and Cardiovascular',
          file_name:    "#{Rails.public_path}/attachments/proj_tag_study_characteristics_terms.xlsx",
          file_type:    'application/vnd.openxmlformats-officedocument.spreads',
          description:  "This 5-page spreadsheet includes information about the MeSH & free text terms that were analyzed to determine which are associated with mental health, oncology or cardiovascular specialties. The first page lists all analyzed MeSH terms (and MeSH IDs) and three Y/N columns to show if the term was determined to be associated with a clinical specialty. The second page does the same for the free text terms. Three other pages: mental health, oncology and cardiovascular, provide a unique list of MeSH & free text terms associated with that specialty. Some terms are associated with more than one clinical specialty. For example, 'Carcinoid Heart Disease' is associated with both oncology and cardiovascular.",
          source:       'The MeSH terms are those from the 2010 MeSH thesaurus branches C, E, F, G that relate to either mental health, oncology or cardiovascular conditions. The free text terms are those related to one of these 3 specialties that occurred in AACT(2010).conditions field with frequency >=5 among interventional studies registered on or after Oct 1, 2007, and that did not exist in MeSH thesaurus.'
        }
      ]
    end

    def self.populate
      ProjTagStudyCharacteristics::TaggedTerm.populate
      ProjTagStudyCharacteristics::AmbiguousTerm.populate
      ProjTagStudyCharacteristics::CardiovascularStudy.populate
      ProjTagStudyCharacteristics::MentalHealthStudy.populate
      ProjTagStudyCharacteristics::OncologyStudy.populate
    end

  end
end
