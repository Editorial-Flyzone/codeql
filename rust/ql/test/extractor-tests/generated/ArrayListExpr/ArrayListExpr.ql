// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from ArrayListExpr x, int getNumberOfExprs, int getNumberOfAttrs
where
  toBeTested(x) and
  not x.isUnknown() and
  getNumberOfExprs = x.getNumberOfExprs() and
  getNumberOfAttrs = x.getNumberOfAttrs()
select x, "getNumberOfExprs:", getNumberOfExprs, "getNumberOfAttrs:", getNumberOfAttrs
