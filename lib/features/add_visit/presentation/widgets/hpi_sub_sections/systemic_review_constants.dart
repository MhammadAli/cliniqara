const Map<String, Map<String, List<String>>> systemicReviewOptions = {
  'General': {
    'Constitutional Symptoms': ['Fever', 'Chills / Rigors', 'Weight loss', 'Appetite change', 'Malaise / Fatigue', 'Night sweats'],
  },
  'Chest': {
    'Core Symptoms': ['Cough', 'Dyspnea', 'Orthopnea', 'PND', 'Chest Pain', 'Expectoration', 'Haemoptysis'],
    'Airway': ['Wheeze', 'Stridor', 'Noisy breathing'],
    'Constitutional': ['Fever', 'Night sweats', 'Weight loss', 'Exercise intolerance'],
    'Upper Airway': ['Hoarseness', 'Sore throat', 'Nasal discharge'],
  },
  'CVS': {
    'Cardiac Symptoms': ['Chest pain', 'Dyspnea', 'Orthopnea', 'PND', 'Palpitations', 'Syncope / Presyncope'],
    'Heart Failure / Volume': ['Peripheral edema', 'Weight gain', 'Fatigue', 'Exercise intolerance', 'Oliguria'],
    'Respiratory Associated': ['Cough', 'Haemoptysis'],
    'Cerebral Perfusion': ['Dizziness', 'Light-headedness', 'Blurring of vision'],
    'Others': ['Cyanosis'],
  },
  'GIT': {
    'Core': ['Abdominal pain', 'Nausea', 'Vomiting', 'Dyspepsia'],
    'Upper GI': ['Anorexia', 'Dysphagia', 'Odynophagia', 'Heartburn', 'Early satiety', 'Hematemesis'],
    'Lower GI': ['Diarrhea', 'Constipation', 'Bloating', 'Tenesmus', 'Urgency', 'Incontinence'],
    'Stool': ['Melena', 'Hematochezia', 'Mucus', 'Steatorrhea', 'Change in caliber'],
    'Hepatobiliary': ['RUQ pain', 'Jaundice', 'Pruritus', 'Ascites', 'Dark urine', 'Pale stool'],
    'General / Associated': ['Weight loss', 'Fatigue', 'Fever'],
  },
  'Renal': {
    'Urinary Symptoms': ['Dysuria', 'Frequency', 'Urgency', 'Nocturia', 'Polyuria', 'Oliguria', 'Hematuria', 'Incontinence'],
    'Flank / Renal Symptoms': ['Flank pain', 'Renal colic', 'Edema'],
    'Associated Symptoms': ['Fever', 'Weight loss', 'Fatigue'],
  },
  'Neurology': {
    'Neurologic Symptoms': ['Headache', 'Dizziness', 'Syncope', 'Seizures', 'Loss of consciousness', 'Weakness', 'Numbness', 'Tingling'],
    'Motor / Functional': ['Gait disturbance', 'Tremor', 'Falls', 'Speech difficulty', 'Memory problems'],
    'Cranial / Sensory': ['Visual disturbance', 'Hearing change', 'Vertigo', 'Facial weakness'],
    'Associated Symptoms': ['Fever', 'Weight loss', 'Fatigue'],
  },
  'Musculoskeletal': {
    'Pain / Joint Symptoms': ['Joint pain', 'Back pain', 'Neck pain', 'Muscle pain', 'Stiffness', 'Swelling'],
    'Function': ['Restricted movement', 'Difficulty walking', 'Difficulty climbing stairs', 'Difficulty using hands', 'Falls'],
    'Inflammatory / Associated': ['Morning stiffness', 'Redness', 'Warmth', 'Deformity', 'Fatigue'],
  },
  'Endocrine': {
    'Metabolic Symptoms': ['Weight gain', 'Weight loss', 'Polyuria', 'Polydipsia', 'Polyphagia', 'Heat intolerance', 'Cold intolerance'],
    'Energy / General': ['Fatigue', 'Weakness', 'Sweating', 'Palpitations'],
    'Hormonal / Other': ['Hair loss', 'Menstrual irregularity', 'Reduced libido', 'Skin darkening', 'Tremor'],
  },
  'Hematology': {
    'Anemia Symptoms': ['Fatigue', 'Weakness', 'Pallor', 'Dyspnea', 'Dizziness'],
    'Bleeding Symptoms': ['Easy bruising', 'Petechiae', 'Epistaxis', 'Gum bleeding', 'Menorrhagia'],
    'Malignancy / Other': ['Night sweats', 'Weight loss', 'Lymphadenopathy', 'Bone pain', 'Fever'],
  },
  'Skin': {
    'Skin Symptoms': ['Rash', 'Pruritus', 'Skin lesions', 'Color change', 'Redness', 'Swelling'],
    'Lesion Features': ['Macules', 'Papules', 'Nodules', 'Vesicles', 'Ulcers'],
    'Hair / Nail / Sensory': ['Hair loss', 'Nail changes', 'Burning', 'Tingling', 'Warmth'],
  },
  'Gynecology': {
    'Menstrual Symptoms': ['Amenorrhea', 'Oligomenorrhea', 'Menorrhagia', 'Dysmenorrhea', 'Intermenstrual bleeding'],
    'Vaginal / Pelvic': ['Vaginal discharge', 'Pruritus', 'Pelvic pain', 'Dyspareunia', 'Vulval irritation'],
    'Hormonal / Structural': ['Subfertility', 'Hirsutism', 'Acne', 'Hot flushes', 'Pelvic mass sensation', 'Prolapse'],
  },
  'Obstetric': {
    'Pregnancy Symptoms': ['Amenorrhea', 'Nausea / vomiting', 'Breast changes', 'Fatigue', 'Urinary frequency'],
    'Late Pregnancy': ['Back pain', 'Dyspnea', 'Edema', 'Constipation', 'Reduced fetal movements'],
    'Red Flags / Labor': ['Vaginal bleeding', 'Severe pain', 'Fluid leakage', 'Contractions', 'Show'],
  },
  'ENT': {
    'Ear Symptoms': ['Hearing loss', 'Tinnitus', 'Vertigo', 'Ear pain', 'Ear discharge'],
    'Nose Symptoms': ['Nasal obstruction', 'Rhinorrhea', 'Epistaxis', 'Sneezing', 'Facial pain', 'Anosmia'],
    'Throat / Neck Symptoms': ['Dysphagia', 'Odynophagia', 'Sore throat', 'Hoarseness', 'Stridor', 'Neck swelling'],
  },
  'Ophthalmology': {
    'Core Eye Symptoms': ['Visual disturbance', 'Eye pain', 'Redness', 'Discharge', 'Photophobia'],
    'Vision Symptoms': ['Blurred vision', 'Diplopia', 'Visual field loss', 'Night blindness'],
    'Ocular Sensory / Structural': ['Foreign body sensation', 'Burning', 'Dry eyes', 'Floaters', 'Flashes', 'Ptosis'],
  },
};

const List<String> availableSystems = [
  'General', 'CVS', 'Chest', 'GIT', 'Renal', 'Neurology', 'Musculoskeletal', 
  'Endocrine', 'Hematology', 'Skin', 'Gynecology', 'Obstetric', 'ENT', 'Ophthalmology'
];

const Map<String, List<String>> abnormalFindingsOptions = {
  'General': ['Fever', 'Weight loss', 'Appetite change', 'Fatigue', 'Night sweats', 'Chills / Rigors'],
  'CVS': ['Chest pain', 'Palpitations', 'Syncope', 'Dyspnea', 'Edema', 'Exercise intolerance'],
  'Chest': ['Cough', 'Dyspnea', 'Wheeze', 'Chest pain', 'Haemoptysis', 'Orthopnea'],
  'GIT': ['Abdominal pain', 'Vomiting', 'Diarrhea', 'Constipation', 'Jaundice', 'GI bleeding'],
  'Renal': ['Dysuria', 'Hematuria', 'Frequency', 'Flank pain', 'Edema', 'Oliguria'],
  'Neurology': ['Headache', 'Seizures', 'Weakness', 'Numbness', 'Dizziness', 'Loss of consciousness'],
  'Musculoskeletal': ['Joint pain', 'Back pain', 'Stiffness', 'Swelling', 'Weakness', 'Restricted movement'],
  'Endocrine': ['Weight change', 'Polyuria', 'Polydipsia', 'Heat intolerance', 'Cold intolerance', 'Fatigue'],
  'Hematology': ['Pallor', 'Easy bruising', 'Bleeding tendency', 'Fever', 'Night sweats', 'Weight loss'],
  'Skin': ['Rash', 'Pruritus', 'Skin lesions', 'Color change', 'Ulcers', 'Swelling'],
  'Gynecology': ['Menstrual irregularity', 'Dysmenorrhea', 'Vaginal discharge', 'Pelvic pain', 'Dyspareunia', 'Abnormal bleeding'],
  'Obstetric': ['Vaginal bleeding', 'Reduced fetal movement', 'Contractions', 'Fluid leakage', 'Severe pain', 'Edema'],
  'ENT': ['Hearing loss', 'Tinnitus', 'Nasal obstruction', 'Epistaxis', 'Sore throat', 'Hoarseness'],
  'Ophthalmology': ['Blurred vision', 'Eye pain', 'Redness', 'Photophobia', 'Diplopia', 'Visual loss'],
};
