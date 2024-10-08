UCD:=16.0.0

tables:
	yeslogic-ucd-generate bidi-class --rust-enum --short-names ../ucd-generate/ucd-$(UCD) > src/char_data/tables.rs
	cargo fmt


.PHONY: tables

