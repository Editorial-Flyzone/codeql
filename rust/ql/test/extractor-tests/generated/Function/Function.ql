// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from
  Function x, string hasParamList, int getNumberOfAttrs, string hasExtendedCanonicalPath,
  string hasCrateOrigin, string hasAbi, string hasBody, string hasGenericParamList, string isAsync,
  string isConst, string isDefault, string isGen, string isUnsafe, string hasName,
  string hasRetType, string hasVisibility, string hasWhereClause
where
  toBeTested(x) and
  not x.isUnknown() and
  (if x.hasParamList() then hasParamList = "yes" else hasParamList = "no") and
  getNumberOfAttrs = x.getNumberOfAttrs() and
  (
    if x.hasExtendedCanonicalPath()
    then hasExtendedCanonicalPath = "yes"
    else hasExtendedCanonicalPath = "no"
  ) and
  (if x.hasCrateOrigin() then hasCrateOrigin = "yes" else hasCrateOrigin = "no") and
  (if x.hasAbi() then hasAbi = "yes" else hasAbi = "no") and
  (if x.hasBody() then hasBody = "yes" else hasBody = "no") and
  (if x.hasGenericParamList() then hasGenericParamList = "yes" else hasGenericParamList = "no") and
  (if x.isAsync() then isAsync = "yes" else isAsync = "no") and
  (if x.isConst() then isConst = "yes" else isConst = "no") and
  (if x.isDefault() then isDefault = "yes" else isDefault = "no") and
  (if x.isGen() then isGen = "yes" else isGen = "no") and
  (if x.isUnsafe() then isUnsafe = "yes" else isUnsafe = "no") and
  (if x.hasName() then hasName = "yes" else hasName = "no") and
  (if x.hasRetType() then hasRetType = "yes" else hasRetType = "no") and
  (if x.hasVisibility() then hasVisibility = "yes" else hasVisibility = "no") and
  if x.hasWhereClause() then hasWhereClause = "yes" else hasWhereClause = "no"
select x, "hasParamList:", hasParamList, "getNumberOfAttrs:", getNumberOfAttrs,
  "hasExtendedCanonicalPath:", hasExtendedCanonicalPath, "hasCrateOrigin:", hasCrateOrigin,
  "hasAbi:", hasAbi, "hasBody:", hasBody, "hasGenericParamList:", hasGenericParamList, "isAsync:",
  isAsync, "isConst:", isConst, "isDefault:", isDefault, "isGen:", isGen, "isUnsafe:", isUnsafe,
  "hasName:", hasName, "hasRetType:", hasRetType, "hasVisibility:", hasVisibility,
  "hasWhereClause:", hasWhereClause
