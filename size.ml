open Core.Std

let explode s = String.to_array s
  |> Array.map ~f:Char.to_string

let human b =
  let u = explode "KMGTPEZY" in
  let m = b |> Int.to_float |> log |> fun x -> x /. log 1000. in
  let r = b |> Int.to_float |> fun x -> x /. 1000. ** m in
  let s = match (Float.to_int m), (Float.to_int r) with
    | (x,_) when x  <> 0     -> u.(x - 1) ^ "B"
    | (_,x) when x lor 0 = 1 -> "Byte"
    | _ -> "Bytes"
  in

  sprintf "%.2f %s" r s