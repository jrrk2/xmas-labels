O = templ.ml args.ml
T = 'random.fods'

run: xmas-labels
	./$< $T $<.fodt

xmas-labels: $O
	ocamlfind ocamlc -package xml-light -linkpkg -o $@ $O
