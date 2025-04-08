open Entity

let rec find_medicine_by_criteria db criteria = match db.medicines with
  | [] -> None
  | m::r when criteria m -> Some m
  | m::r -> find_medicine_by_criteria r criteria

let by_name name = fun m -> m.name = name
                   
let by_cis cis = fun m -> m.cis_code = cis
                 
let find_medicine_by_name db name = find_medicine_by_criteria db (by_name name)
    
let find_medicine_by_cis db cis = find_medicine_by_criteria db (by_cis cis)

    
(*****************************)
                              
      
let find_doctor_by_criteria db criteria = match db.doctors with
  | [] -> None
  | d::r when criteria d -> Some d
  | d::r -> find_doctor_by_criteria r criteria
              
let by_phone phone = fun d -> d.phone = phone
                     
let by_name name = fun d -> d.name = name
                   
let by_firstname firstname = fun d -> d.firstname = firstname
                             
let find_doctor_by_phone db phone = find_medicine_by_criteria db (by_phone phone)
                                 
let find_doctor_by_name db name = find_medicine_by_criteria db (by_name name)
                                 
let find_doctor_by_firstname db firstname = find_medicine_by_criteria db (by_firstname firstname)
    
    
(*****************************)
       
                                                     
let add_item_to_db_field item db_field = item::db_field
                                         
let add_doctor_to_db doctor db = add_item_to_db_field doctor db.doctors
    
let add_medicine_to_db medicine db = add_item_to_db_field medicine db.medicines
    
let add_interaction_to_db medicine_interaction db = add_item_to_db_field medicine_interaction db.interactions
  
    
(*****************************)
                              
    
let rec get_interactions db medicine = match db.interactions with
  | [] -> []
  | i::r when i.medicine1.name = medicine.name -> (i.medicine2,i.symptom)::(get_interactions r medicine) (* when MEDICINE interacting with XXX *)
  | i::r when i.medicine2.name = medicine.name -> (i.medicine1,i.symptom)::(get_interactions r medicine) (* when XXX interacting with MEDICINE *)
  | i::r -> get_interactions r medicine 