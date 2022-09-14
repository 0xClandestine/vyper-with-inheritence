#! /usr/bin/env python3
import argparse
import os
import re

# TODO add proper version support

# NOTE 'import' is now a vyper 'native' keyword ;)

# clear terminal
# os.system('cls' if os.name == 'nt' else 'clear')

class Flattener:

    imports = []

    def __init__(self, base_file_path, compiled_file_path):
        
        self.base_file_path = base_file_path
        
        self.compiled_file_path = compiled_file_path

        self.imports = self.parse_imports()
        
        self.concat(self.imports)

    # parse imports from base file

    def parse_imports(self):
        
        base_file = open(self.base_file_path, "r")

        base_data = base_file.read()

        base_string_array = re.split("\s", base_data)
        
        base_string_array_len = 0

        for i in base_string_array:
            
            base_string_array_len += 1

            if i == "import":
                self.imports.append(base_string_array[base_string_array_len])

        return self.imports

    # combines imports with base file in order they were declared

    def concat(self, imports):
    
        # erase any code that may already exist in the compile file
        compile_file = open(self.compiled_file_path, "w")
        compile_file.write("")

        compile_file = open(self.compiled_file_path, "a")
        import_index = 0

        for i in imports:
            import_file = open(imports[import_index], "r")
            import_data = import_file.read()

            compile_file.write(import_data)
            
            import_index += 1

        base_file = open(self.base_file_path, "r")
        base_data = base_file.read()

        compile_file.write(base_data)

# cli support
parser = argparse.ArgumentParser()

parser.add_argument("file", help="file to compile", type=str)

parser.add_argument("output", help="file to compile to", type=str)

args = parser.parse_args()

Flattener(args.file, args.output)