// generated by codegen/codegen.py, do not edit
import codeql.swift.elements
import TestUtils

from PoundDiagnosticDecl x, int index
where toBeTested(x) and not x.isUnknown()
select x, index, x.getMember(index)
