// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from ForTypeRepr x, string hasGenericParamList, string hasTypeRepr
where
  toBeTested(x) and
  not x.isUnknown() and
  (if x.hasGenericParamList() then hasGenericParamList = "yes" else hasGenericParamList = "no") and
  if x.hasTypeRepr() then hasTypeRepr = "yes" else hasTypeRepr = "no"
select x, "hasGenericParamList:", hasGenericParamList, "hasTypeRepr:", hasTypeRepr
