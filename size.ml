let human (b:int) =
  let u = [|"K";"M";"G";"T";"P";"E";"Z";"Y"|] in
  let m = b |> float_of_int |> log |> fun x -> x /. log 1000. in
  let r = b |> float_of_int |> fun x -> x /. 1000. ** m in
  let s = match (int_of_float m), (int_of_float r) with
    | (x,_) when x  <> 0     -> u.(x - 1) ^ "B"
    | (_,x) when x lor 0 = 1 -> "Byte"
    | _ -> "Bytes"
  in

  Printf.sprintf "%.2f %s" r s