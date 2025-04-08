(* The type representing a medicine with its properties *)
type medicine = {
  name : string;
  cis_code : string;
} 

(* A string type for symptoms *)
type symptom = string

(* A type for medicine interactions, indicating which medicines interact and the symptom it causes *)
type medicine_interaction = {
  medicine1 : medicine;
  medicine2 : medicine;
  symptom : symptom;
} 


(*****************************)


(* Duration and dosage for prescribing a medicine *)
type duration = string
type dosage_unit = Pillule | Comprimé | mg | g | ml
type dosage_amount = int

(* Posology is a pair of duration, amount and dosage *)
type posology = duration * dosage_amount * dosage_unit

(* A type for prescribed medicines with their posology information *)
type prescribed_medicine = {
  medicine: medicine;
  posology: posology;
}


(*****************************)


(* Doctor have a name, first name and rpps and can potentially have an address and a phone *)
type doctor = {
  address: string option;
  phone: string option;
  name: string;
  firstname: string;
  rpps: int;
}

(* Date is defined by a day, month and year *)
type date = {
  day: string;
  month: string;
  year: string;
}


(*****************************)


type prescription = {
  doctor: doctor;
  prescription_date: date; 
  prescribed_medicines: prescribed_medicine list;
}


(*****************************)


(* Medicine Database is a type that store interactions and medicines *)
type medicine_db = {
  medicines : medicine list;
  interactions : medicine_interaction list;
}

(* Doctor Database is a type that store doctors *)
type doctor_db = {
  doctors : doctor list 
}
