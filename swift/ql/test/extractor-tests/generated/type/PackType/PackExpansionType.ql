// generated by codegen/codegen.py, do not edit
import codeql.swift.elements
import TestUtils

from
  PackExpansionType x, string getName, Type getCanonicalType, Type getPatternType, Type getCountType
where
  toBeTested(x) and
  not x.isUnknown() and
  getName = x.getName() and
  getCanonicalType = x.getCanonicalType() and
  getPatternType = x.getPatternType() and
  getCountType = x.getCountType()
select x, "getName:", getName, "getCanonicalType:", getCanonicalType, "getPatternType:",
  getPatternType, "getCountType:", getCountType
