select
    RECEIPTS.RECEIPT_ID as RECEIPT_ID,
    RECEIPTS.PI_ID as RECEIPTS_PI_ID,
    RECEIPTS.PATIENT_ID as PATIENT_ID,
    RECEIPTS.DOCTOR_ID as DOCTOR_ID,
    RECEIPTS.CASHIER_ID as CASHIER_ID,
    RECEIPTS.P_TOTAL as P_TOTAL,
    RECEIPTS.RECEIPT_DATE as RECEIPT_DATE,
    RECEIPTSERVICES.SERVICE_ID as SERVICE_ID,
    RECEIPTSERVICES.RECEIPT_ID as RECEIPT_ID,
    RECEIPTSERVICES.PI_ID as PI_ID,
    RECEIPTSERVICES.SP_TOTAL as SP_TOTAL,
    DRUG_TOTAL.DRUG_ID as DRUG_ID,
    DRUG_TOTAL.RECEIPT_ID as RECEIPT_ID_1,
    DRUG_TOTAL.DP_TOTAL as DP_TOTAL,
    DRUG_TOTAL.PI_ID as PI_ID_1,
    DRUG.D_NAME as D_NAME,
    DRUG.D_TYPE as D_TYPE,
    DRUG.EXP_DATE as EXP_DATE,
    DRUG.PRICE as PRICE,
    DRUG.WITHDRAWD_ABLE as WITHDRAWD_ABLE,
    CASHIERS.FNAME||' '||CASHIERS.LNAME as CASHIER_NAME, 
    CASHIERS.FNAME as CAS_FNAME, 
    CASHIERS.LNAME as CAS_LNAME,
    DOCTORS.FNAME||' '||DOCTORS.LNAME as DOCTOR_NAME, 
    DOCTORS.FNAME as DOC_FNAME,
    DOCTORS.LNAME as DOC_LNAME,
    PATIENTS.FNAME||' '||PATIENTS.LNAME  as PATIENTS_NAME, 
    PATIENTS.FNAME as PATIENTS_FNAME,
    PATIENTS.LNAME as PATIENTS_LNAME,
    PATIN.EXP_DATE as PATIN_EXP_DATE,
    PATIN.DISCOUNT_D as DISCOUNT_DRUG,
    PATIN.DISCOUNT_S as DISCOUNT_SERVICE
from
    DRUG DRUG,
    DRUG_TOTAL DRUG_TOTAL,
    RECEIPTSERVICES RECEIPTSERVICES,
    CASHIERS CASHIERS,
    DOCTORS DOCTORS,
    PATIENTS PATIENTS,
    PATIN PATIN,
    RECEIPTS RECEIPTS
where
    RECEIPTS.PI_ID = PATIN.PI_ID
    and RECEIPTS.PATIENT_ID = PATIENTS.PATIENT_ID
    and RECEIPTS.DOCTOR_ID = DOCTORS.DOCTOR_ID
    and RECEIPTS.CASHIER_ID = CASHIERS.CASHIER_ID
    and RECEIPTS.RECEIPT_ID = RECEIPTSERVICES.RECEIPT_ID
    and RECEIPTS.RECEIPT_ID = DRUG_TOTAL.RECEIPT_ID
    and DRUG_TOTAL.DRUG_ID = DRUG.DRUG_ID