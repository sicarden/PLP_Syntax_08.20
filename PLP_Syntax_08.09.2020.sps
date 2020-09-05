* Encoding: UTF-8.
* Encoding: .
* Encoding: .
* Encoding: .
* Encoding: .
# This is the code to get data

get file = '/Users/sofiacardenas/Desktop/PLP/4.JournalofFamilyPsychology_Submission/Data/HATCH_04.08.2020.sav'.

# This is the fillter variabe for fathers with PLP data excluding 22 and 41 b/c they dont have postpartum data
USE ALL.
COMPUTE filter_$=((patleaverecode3 >= 0) AND (CoupID <> 22) AND (CoupID <> 41)).
VARIABLE LABELS filter_$ '(patleaverecode3 >= 0) AND (CoupID <> 22) AND (CoupID <> 41) (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

# This is the fillter variabe for fathrers with PLP data excluding those with 999 for PSQI 
USE ALL.

USE ALL.
COMPUTE filter_$=((patleaverecode3 >= 0 AND pnPSQI_daydys.2 < 999 AND PSQI_daydys.2pp < 999)).
VARIABLE LABELS filter_$ '(patleaverecode3 >= 0 AND pnPSQI_daydys.2 < 999 AND PSQI_daydys.2pp < '+
    '999) (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

# Make sure you  change patleavecode3 to categorical
# Participants 

#Age of mothers 

FREQUENCIES VARIABLES=pnAge_1.1
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Age of fathers 

FREQUENCIES VARIABLES=pnAge_1.2
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Demographic breakdown

# Percentage of leave versus no leave 

FREQUENCIES VARIABLES=patleaverecode3
  /PIECHART FREQ
  /ORDER=ANALYSIS.

#Date of prenatal visit

FREQUENCIES VARIABLES=Weekspreg.2
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN
  /HISTOGRAM
  /ORDER=ANALYSIS.

# Date of postpartum visit

FREQUENCIES VARIABLES=bage6pp
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN
  /HISTOGRAM
  /ORDER=ANALYSIS.

# Race of mothers

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Ethnicity.1 
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Race of fathers 

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Ethnicity.2
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Education of mothers

FREQUENCIES VARIABLES=Education.1 
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Education of fathers

FREQUENCIES VARIABLES=Education.2
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Measures

# Prenatal Measures

# WeeksPregnant/Gestational Age

FREQUENCIES VARIABLES=Weekspreg.2
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Mothers PSQI

FREQUENCIES VARIABLES=pnPSQI_daydys.1 
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Fathers PSQI

FREQUENCIES VARIABLES=pnPSQI_daydys.2 
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Mothers BDI

FREQUENCIES VARIABLES=pnBDIsum.1 
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Fathers BDI

FREQUENCIES VARIABLES=pnBDIsum.2 
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Mothers PSS

FREQUENCIES VARIABLES=pnPSS.1 
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Fathers PSS

FREQUENCIES VARIABLES=pnPSS.2
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Postpartum Measures

# Mothers PSQI

FREQUENCIES VARIABLES=PSQI_daydys.1pp
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Fathers PSQI

FREQUENCIES VARIABLES=PSQI_daydys.2pp
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Mothers BDI

FREQUENCIES VARIABLES=BDI1pp
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Fathers BDI

FREQUENCIES VARIABLES=BDI2pp
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Mothers PSS

FREQUENCIES VARIABLES=PSS.1pp
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# Fathers PSS

FREQUENCIES VARIABLES=PSS.2pp
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

# InfantAge

FREQUENCIES VARIABLES=bage6pp
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN
  /PIECHART FREQ
  /ORDER=ANALYSIS.

#Type of leave

FREQUENCIES VARIABLES=Leave.2
  /PIECHART PERCENT
  /ORDER=ANALYSIS.

# Covariates

# Difference between age of mother with or without PL 

T-TEST GROUPS=patleaverecode3(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=pnAge_1.1
  /CRITERIA=CI(.95).

# Difference between age of father with or without PL

T-TEST GROUPS=patleaverecode3(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=pnAge_1.2
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES=pnAge_1.2 BY patleaverecode3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED 
  /COUNT ROUND CELL.

# Difference between education of mother with or without PL 

T-TEST GROUPS=patleaverecode3(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=Education.1
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES=Education.1 BY patleaverecode3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED 
  /COUNT ROUND CELL.

# Difference between education of father with or without PL

T-TEST GROUPS=patleaverecode3(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=Education.2
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES=Education.2 BY patleaverecode3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED 
  /COUNT ROUND CELL.

# Difference between ethnicity of mother with or without PL

CROSSTABS
  /TABLES=Ethnicity.1 BY patleaverecode3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED  
  /COUNT ROUND CELL.

# Difference between ethnicity of father with or without PL

CROSSTABS
  /TABLES=Ethnicity.2 BY patleaverecode3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED 
  /COUNT ROUND CELL.

# Difference between mariage status of parents with or without PL

CROSSTABS
  /TABLES=RelStat BY patleaverecode3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED 
  /COUNT ROUND CELL.

# Results

# ANOVA Fathers

# PSQI.2 w/o education

GLM pnPSQI_daydys.2 PSQI_daydys.2pp BY patleaverecode3 WITH Weekspreg.2 bage6pp
  /WSFACTOR=PSQI.2 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PSQI.2*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=PSQI.2 
  /DESIGN=Weekspreg.2 bage6pp patleaverecode3.

# PSQI.2 w/ education

GLM pnPSQI_daydys.2 PSQI_daydys.2pp BY patleaverecode3 WITH Weekspreg.2 bage6pp Education.2 
  /WSFACTOR=PSQI.2 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PSQI.2*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=PSQI.2 
  /DESIGN=Weekspreg.2 bage6pp Education.2 patleaverecode3.
     
# BDI.2 w/o education  

GLM pnBDIsum.2 BDI2pp BY patleaverecode3 WITH Weekspreg.2 bage6pp
  /WSFACTOR=BDI.2 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(BDI.2*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BDI.2 
  /DESIGN=Weekspreg.2 bage6pp patleaverecode3.

# BDI.2 w/ education

GLM pnBDIsum.2 BDI2pp BY patleaverecode3 WITH Weekspreg.2 bage6pp Education.2
  /WSFACTOR=BDI.2 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(BDI.2*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BDI.2 
  /DESIGN=Weekspreg.2 bage6pp Education.2 patleaverecode3.

# PSS.2 w/o education 

GLM pnPSS.2 PSS.2pp BY patleaverecode3 WITH Weekspreg.2 bage6pp
  /WSFACTOR=PSS.2 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PSS.2*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=PSS.2 
  /DESIGN=Weekspreg.2 bage6pp patleaverecode3.

# PSS.2 w/ education 

GLM pnPSS.2 PSS.2pp BY patleaverecode3 WITH Weekspreg.2 bage6pp Education.2 
  /WSFACTOR=PSS.2 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PSS.2*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=PSS.2 
  /DESIGN=Weekspreg.2 bage6pp Education.2 patleaverecode3.

# ANOVA Mothers 

# PSQI.1 w/o education 

GLM pnPSQI_daydys.1 PSQI_daydys.1pp BY patleaverecode3 WITH Weekspreg.2 bage6pp
  /WSFACTOR=PSQI.1 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PSQI.1*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=PSQI.1 
  /DESIGN=Weekspreg.2 bage6pp patleaverecode3.

 # PSQI.1 w/ education 
  
GLM pnPSQI_daydys.1 PSQI_daydys.1pp BY patleaverecode3 WITH Weekspreg.2 bage6pp Education.1
  /WSFACTOR=PSQI.1 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PSQI.1*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=PSQI.1 
  /DESIGN=Weekspreg.2 bage6pp Education.1 patleaverecode3.
  
# BDI.1 w/o education 

GLM pnBDIsum.1 BDI1pp BY patleaverecode3 WITH Weekspreg.2 bage6pp
  /WSFACTOR=BDI.1 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(BDI.1*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BDI.1 
  /DESIGN=Weekspreg.2 bage6pp patleaverecode3.
      
# BDI.1  w/ education 

GLM pnBDIsum.1 BDI1pp BY patleaverecode3 WITH Weekspreg.2 bage6pp Education.1
  /WSFACTOR=BDI.1 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(BDI.1*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BDI.1 
  /DESIGN=Weekspreg.2 bage6pp Education.1 patleaverecode3.

# PSS.1 w/o education

GLM pnPSS.1 PSS.1pp BY patleaverecode3 WITH Weekspreg.2 bage6pp
  /WSFACTOR=PSS.1 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PSS.1*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=PSS.1 
  /DESIGN=Weekspreg.2 bage6pp patleaverecode3.

# PSS.1 w/ education 

GLM pnPSS.1 PSS.1pp BY patleaverecode3 WITH Weekspreg.2 bage6pp Education.1
  /WSFACTOR=PSS.1 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PSS.1*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=PSS.1 
  /DESIGN=Weekspreg.2 bage6pp Education.1 patleaverecode3.
        
# Correlation Table

# Mother Correlations

CORRELATIONS
  /VARIABLES=pnPSQI_daydys.1 pnBDIsum.1 pnPSS.1 Weekspreg.2 PSQI_daydys.1pp BDI1pp PSS.1pp bage6pp 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

# Father Correlations

CORRELATIONS
  /VARIABLES=pnPSQI_daydys.2 pnBDIsum.2 pnPSS.2 Weekspreg.2 PSQI_daydys.2pp BDI2pp PSS.2pp bage6pp 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

# Mothers and Fathers T-tests BDI andd PSS 

T-TEST GROUPS=patleaverecode3(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=pnBDIsum.1 pnPSS.1 BDI1pp PSS.1pp pnBDIsum.2 pnPSS.2 BDI2pp PSS.2pp
  /CRITERIA=CI(.95).

# Mothers and Fathers T-tests PSQI (need to use the second selection group)

T-TEST GROUPS=patleaverecode3(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=pnPSQI_daydys.1 PSQI_daydys.1pp pnPSQI_daydys.2 PSQI_daydys.2pp
  /CRITERIA=CI(.95).

#  Mom PSS Box Plot

EXAMINE VARIABLES=pnPSS.1 PSS.1pp BY patleaverecode3
  /COMPARE VARIABLE
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL
  /MISSING=LISTWISE.

# Mom BDI Box Plot

EXAMINE VARIABLES=pnBDIsum.1 BDI1pp BY patleaverecode3
  /COMPARE VARIABLE
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL
  /MISSING=LISTWISE.

# Dad PSQI Box Plot 

USE ALL.
COMPUTE filter_$=((pnPSQI_daydys.2  <  999) AND (PSQI_daydys.2pp < 999) AND (CoupID <> 22)  AND 
    (CoupID <> 41) AND (patleaverecode3 >= 0)).
VARIABLE LABELS filter_$ '(pnPSQI_daydys.2  <  999) AND (PSQI_daydys.2pp < 999) AND (CoupID <> '+
    '22)  AND (CoupID <> 41) AND (patleaverecode3 >= 0) (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GRAPH
  /BAR(GROUPED)=MEAN(pnPSQI_daydys.2) MEAN(PSQI_daydys.2pp) BY patleaverecode3
  /MISSING=LISTWISE
  /INTERVAL CI(95.0).

EXAMINE VARIABLES=pnPSQI_daydys.2 PSQI_daydys.2pp BY patleaverecode3
  /COMPARE VARIABLE
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL
  /MISSING=LISTWISE REPORT.

# FINAL GRAPHS

GLM pnBDIsum.1 BDI1pp BY patleaverecode3 WITH bage6pp Weekspreg.2 Education.1
  /WSFACTOR=BDI.Mom 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(BDI.Mom*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BDI.Mom 
  /DESIGN=bage6pp Weekspreg.2 Education.1 patleaverecode3.

GLM pnPSS.1 PSS.1pp BY patleaverecode3 WITH bage6pp Weekspreg.2 Education.1
  /WSFACTOR=BDI.Mom 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(BDI.Mom*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BDI.Mom 
  /DESIGN=bage6pp Weekspreg.2 Education.1 patleaverecode3.

GLM pnPSQI_daydys.2 PSQI_daydys.2pp BY patleaverecode3 WITH bage6pp Weekspreg.2 Education.2
  /WSFACTOR=PSQI.2 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PSQI.2*patleaverecode3) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=PSQI.2 
  /DESIGN=bage6pp Education.2 Weekspreg.2 patleaverecode3.



