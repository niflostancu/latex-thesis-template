#!/usr/bin/env python3 
import sys
import os
import os.path
import re

inputPattern = re.compile(r'\s*\\(input)?{(.*)}') 
importPattern = re.compile(r'\s*\\(includefrom|subimport){(.*)}{(.*)}') 

def flattenLatex(rootFilename, rootPath): 
    dirpath, filename = os.path.split(rootFilename) 
    with open(rootFilename,'r') as fh: 
        for line in fh: 
            match = inputPattern.match(line) 
            import_match = importPattern.match(line) 
            if match: 
                newFile = match.group(2) 
                if not newFile.endswith('tex'): 
                    newFile += '.tex' 
                flattenLatex(os.path.join(rootPath, newFile), rootPath) 
            elif import_match:
                newRoot = os.path.join(rootPath, import_match.group(2))
                newFile = os.path.join(newRoot, import_match.group(3))
                if not newFile.endswith('tex'):
                    newFile += '.tex' 
                flattenLatex(newFile, newRoot)
            else: 
                sys.stdout.write(line) 


if __name__ == "__main__": 
    flattenLatex(sys.argv[1], '.')

