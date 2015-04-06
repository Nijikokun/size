type t =
  | Bits_t of int
  | Bytes_t of int

(* Generate human readable filesize from bytes *)
val human : ?a:float -> t -> string