type t =
  | Bits_t of int
  | Bytes_t of int

let human ?(a = 1024.) b =
  let u = [|""; "K";"M";"G";"T";"P";"E";"Z";"Y"|] in

  let (v, ss, n) = match b with
    | Bits_t x -> (x, "b", "Bit")
    | Bytes_t x -> (x, "B", "Byte")
  in

  let rec loop l o = match l, o with
    | (l, o) when l >= a && (o + 1) < (Array.length u) -> loop (l /. a) (o + 1)
    | x -> x
  in

  let (l, o) = loop (float_of_int v) 0 in

  let s = match u.(o) with
    | t when t = "" -> n ^ (if ((int_of_float l) lxor 0) = 1 then "s" else "")
    | x -> x ^ ss
  in

  Printf.sprintf "%.2f %s" l s