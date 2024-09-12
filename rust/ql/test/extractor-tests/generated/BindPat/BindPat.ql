// generated by codegen
import codeql.rust.elements
import TestUtils

from BindPat x, string getBindingId, string hasSubpat
where
  toBeTested(x) and
  not x.isUnknown() and
  getBindingId = x.getBindingId() and
  if x.hasSubpat() then hasSubpat = "yes" else hasSubpat = "no"
select x, "getBindingId:", getBindingId, "hasSubpat:", hasSubpat
