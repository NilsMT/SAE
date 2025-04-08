open Medlib

let () =
  try
    let doctor_db = read_doctors "doctors.csv" in
    let medicine_db = read_medicines "medicines.csv" in
    let interaction_db = read_interactions "interactions.csv" medicine_db in

    (* Print doctors, medicines, and interactions *)
    List.iter (fun d -> Printf.printf "Doctor: %s %s\n" d.firstname d.name) doctor_db.doctors;
    List.iter (fun m -> Printf.printf "Medicine: %s %s\n" m.name m.cis_code) medicine_db.medicines;
    List.iter (fun i -> Printf.printf "Interaction: %s with %s, Symptom: %s\n" i.medicine1.name i.medicine2.name i.symptom) interaction_db.interactions;
  with
  | Failure msg -> Printf.printf "Error: %s\n" msg
