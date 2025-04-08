open Csv
open Entity

let read_doctors file_name doctor_db =
  let csv = Csv.load file_name in
  let doctors =
    List.tl csv (* Skip header *)
    |> List.filter_map (fun row ->
      match row with
      | [addr; phone; name; firstname; rpps_str] ->
          let address = if addr = "" then None else Some addr in
          let phone = if phone = "" then None else Some phone in
          let rpps = try Some (int_of_string rpps_str) with Failure _ -> None in
          (match rpps with
            | Some rpps -> Some { Entity.address; phone; Entity.name; Entity.firstname; Entity.rpps }
            | None -> None)
      | _ -> None
    )
  in
  { doctors = doctor_db.doctors @ doctors }
