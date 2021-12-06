open Xml

let tablefile1 = parse_file Sys.argv.(1)

type ext = {mutable row: int; mutable col: int}

let ext = {row=0; col=0}
let data = Array.make_matrix 100 100 ""

let rec extract ext = function
| Element ("table:table-row", style, columns) -> ext.col <- 0; ext.row <- ext.row+1; List.iter (extract ext) columns
| Element ("table:table-cell", style, [Element ("text:p", [], [PCData txt])]) -> data.(ext.row).(ext.col) <- txt; ext.col <- ext.col + 1
| Element (_, style, inner) -> List.iter (extract ext) inner
| PCData _ -> ()

let _ = extract ext tablefile1

let templ = Templ.templ2 data ext.row;;
let fd = open_out Sys.argv.(2);;
let _ = output_string fd ("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"^to_string_fmt templ);;
let _ = close_out fd

