open Csv
open Entity

let read_interactions file_name medicines_db =
  let csv = Csv.load file_name in
  let interactions =
    List.tl csv (* Skip header *)
    |> List.filter_map (fun row ->
      match row with
      | [medicine1_name; medicine1_cis_code; medicine2_name; medicine2_cis_code; symptom] ->
          let medicine1_opt = List.find_opt (fun m -> m.name = medicine1_name && m.cis_code = medicine1_cis_code) medicines_db.medicines in
          let medicine2_opt = List.find_opt (fun m -> m.name = medicine2_name && m.cis_code = medicine2_cis_code) medicines_db.medicines in
          (match (medicine1_opt, medicine2_opt) with
            | (Some medicine1, Some medicine2) -> Some { Entity.medicine1; Entity.medicine2; Entity.symptom }
            | _ -> 
                (* Raise an error if a medicine is missing *)
                let missing_meds = 
                  if medicine1_opt = None then medicine1_name else
                  if medicine2_opt = None then medicine2_name else
                  ""
                in
                raise (Failure ("This medicine: " ^ missing_meds ^ " doesn't exist in the database, consider adding it"))
          )
      | _ -> None
    )
  in
  { medicines = medicines_db.medicines; interaction = medicines_db.interactions @ interactions }  