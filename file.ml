let try_input_line (in_chan : in_channel) =
  try
    Some (input_line in_chan)
  with End_of_file ->
    None

let read_all_lines (in_chan : in_channel) =
  let rec f ls =
    let line = try_input_line in_chan in
    match line with
    | Some ln -> f (ln :: ls)
    | None -> ls
  in
  (f []) |> List.rev
