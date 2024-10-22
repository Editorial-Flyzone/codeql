// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from
  Impl x, string hasCanonicalPath, string hasCrateOrigin, string hasAssocItemList,
  int getNumberOfAttrs, string hasGenericParamList, string isConst, string isDefault,
  string isUnsafe, string hasSelfTy, string hasTrait, string hasVisibility, string hasWhereClause
where
  toBeTested(x) and
  not x.isUnknown() and
  (if x.hasCanonicalPath() then hasCanonicalPath = "yes" else hasCanonicalPath = "no") and
  (if x.hasCrateOrigin() then hasCrateOrigin = "yes" else hasCrateOrigin = "no") and
  (if x.hasAssocItemList() then hasAssocItemList = "yes" else hasAssocItemList = "no") and
  getNumberOfAttrs = x.getNumberOfAttrs() and
  (if x.hasGenericParamList() then hasGenericParamList = "yes" else hasGenericParamList = "no") and
  (if x.isConst() then isConst = "yes" else isConst = "no") and
  (if x.isDefault() then isDefault = "yes" else isDefault = "no") and
  (if x.isUnsafe() then isUnsafe = "yes" else isUnsafe = "no") and
  (if x.hasSelfTy() then hasSelfTy = "yes" else hasSelfTy = "no") and
  (if x.hasTrait() then hasTrait = "yes" else hasTrait = "no") and
  (if x.hasVisibility() then hasVisibility = "yes" else hasVisibility = "no") and
  if x.hasWhereClause() then hasWhereClause = "yes" else hasWhereClause = "no"
select x, "hasCanonicalPath:", hasCanonicalPath, "hasCrateOrigin:", hasCrateOrigin,
  "hasAssocItemList:", hasAssocItemList, "getNumberOfAttrs:", getNumberOfAttrs,
  "hasGenericParamList:", hasGenericParamList, "isConst:", isConst, "isDefault:", isDefault,
  "isUnsafe:", isUnsafe, "hasSelfTy:", hasSelfTy, "hasTrait:", hasTrait, "hasVisibility:",
  hasVisibility, "hasWhereClause:", hasWhereClause
