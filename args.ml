open Xml

let tablefile1 = parse_file Sys.argv.(1)

type ext = {mutable row: string array list; mutable col: int; data: string array}

let ext = {row=[]; col=0; data=Array.make 10 ""}

let rec extract ext = function
| Element ("table:table-row", style, columns) -> if ext.col > 0 then ext.row <- Array.copy ext.data :: ext.row; ext.col <- 0; List.iter (extract ext) columns
| Element ("table:table-cell", style, [Element ("text:p", [], [PCData txt])]) -> ext.data.(ext.col) <- txt; ext.col <- ext.col + 1
| Element (_, style, inner) -> List.iter (extract ext) inner
| PCData _ -> ()

let _ = extract ext tablefile1

let templ = Templ.templ2 (Array.of_list ( Array.make 10 "" :: List.rev ( List.init 14 (fun _ -> Array.make 10 "") @ ext.row))) (List.length ext.row);;
let fd = open_out Sys.argv.(2);;
let _ = output_string fd ("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"^to_string_fmt templ);;
let _ = close_out fd

