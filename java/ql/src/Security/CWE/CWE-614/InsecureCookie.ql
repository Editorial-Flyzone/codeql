/**
 * @name Failure to use secure cookies
 * @description Insecure cookies may be sent in cleartext, which makes them vulnerable to
 *              interception.
 * @kind problem
 * @problem.severity error
 * @security-severity 5.0
 * @precision high
 * @id java/insecure-cookie
 * @tags security
 *       external/cwe/cwe-614
 */

import java
import semmle.code.java.frameworks.Servlets
import semmle.code.java.dataflow.DataFlow

predicate isSafeSecureCookieSetting(Expr e) {
  e.(CompileTimeConstantExpr).getBooleanValue() = true
  or
  exists(Method isSecure |
    isSecure.getName() = "isSecure" and
    isSecure.getDeclaringType().getASourceSupertype*() instanceof ServletRequest
  |
    e.(MethodAccess).getMethod() = isSecure
  )
}

class SecureCookieConfiguration extends DataFlow::Configuration {
  SecureCookieConfiguration() { this = "SecureCookieConfiguration" }

  override predicate isSource(DataFlow::Node source) { any() }

  override predicate isSink(DataFlow::Node sink) { any() }
}

from MethodAccess add, SecureCookieConfiguration df
where
  add.getMethod() instanceof ResponseAddCookieMethod and
  not exists(Variable cookie, MethodAccess m |
    df.hasFlow(DataFlow::exprNode(cookie.getAnAccess()), DataFlow::exprNode(add.getArgument(0))) and
    m.getMethod().getName() = "setSecure" and
    forex(DataFlow::Node argSource |
      DataFlow::localFlow(argSource, DataFlow::exprNode(m.getArgument(0))) and
      not DataFlow::localFlowStep(_, argSource)
    |
      isSafeSecureCookieSetting(argSource.asExpr())
    ) and
    m.getQualifier() = cookie.getAnAccess()
  )
select add, "Cookie is added to response without the 'secure' flag being set."
