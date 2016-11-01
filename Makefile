LIB_OUT_FILE  = lib
EX_OUT_FILE   = example

OCAML_FILES   = capture.ml

EXAMPLE_FILE  = example.ml

C_FILES       = capture_c.c

ML_PKG_STRING = -package bigarray -linkpkg
C_LIB_STRING  = -cclib -lv4l2
C_OPT_STRING  = -ccopt -O3 -ccopt -Wall
ML_OPT_STRING = -O3 -g
DEBUG         = 

SOURCE_DIR    = src
BUILD_DIR     = build


lib:
	rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	cp $(SOURCE_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && ocamlfind ocamlopt -c $(C_LIB_STRING) $(C_OPT_STRING) $(OCAML_FILES) $(C_FILES) $(ML_PKG_STRING)
	cd $(BUILD_DIR) && ocamlfind ocamlopt -a -o $(LIB_OUT_FILE) *.cmx *.o

example:
	rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	cp $(SOURCE_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && ocamlfind ocamlopt $(DEBUG) -o $(EX_OUT_FILE) $(C_LIB_STRING) $(C_OPT_STRING) $(OCAML_FILES) $(EXAMPLE_FILE) $(C_FILES) $(ML_PKG_STRING)
	cp $(BUILD_DIR)/$(EX_OUT_FILE) $(EX_OUT_FILE)

clean:
	rm -rf $(BUILD_DIR)
	rm $(EX_OUT_FILE) 
