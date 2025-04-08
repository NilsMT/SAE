open Entity

let read_medicines file_name medicine_db =
  let csv = Csv.load file_name in
  let medicines =
    List.tl csv (* Skip header *)
    |> List.filter_map (fun row ->
      match row with
      | [name; cis_code] -> Some { Entity.name; Entity.cis_code }  (* Create a medicine record directly *)
      | _ -> None
    )
  in
  { medicines = medicines_db.medicines @ medicines; interactions = medicines_db.interactions }