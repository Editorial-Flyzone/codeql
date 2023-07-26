/** Provides classes and predicates to reason about trust boundary violations */

import java
private import semmle.code.java.dataflow.DataFlow
private import semmle.code.java.controlflow.Guards
private import semmle.code.java.dataflow.ExternalFlow
private import semmle.code.java.dataflow.FlowSources
private import semmle.code.java.frameworks.owasp.Esapi

/**
 * A source of data that crosses a trust boundary.
 */
abstract class TrustBoundaryViolationSource extends DataFlow::Node { }

/**
 * A node representing a servlet request.
 */
private class ServletRequestSource extends TrustBoundaryViolationSource {
  ServletRequestSource() { this.asExpr().getType() instanceof HttpServletRequest }
}

/**
 * A sink for data that crosses a trust boundary.
 */
class TrustBoundaryViolationSink extends DataFlow::Node {
  TrustBoundaryViolationSink() { sinkNode(this, "trust-boundary") }
}

/**
 * A sanitizer for data that crosses a trust boundary.
 */
abstract class TrustBoundaryValidationSanitizer extends DataFlow::Node { }

/**
 * A node validated by an OWASP ESAPI validation method.
 */
private class EsapiValidatedInputSanitizer extends TrustBoundaryValidationSanitizer {
  EsapiValidatedInputSanitizer() {
    this = DataFlow::BarrierGuard<esapiIsValidData/3>::getABarrierNode() or
    this.asExpr().(MethodAccess).getMethod() instanceof EsapiGetValidMethod
  }
}

/**
 * Holds if `g` is a guard that checks that `e` is valid data according to an OWASP ESAPI validation method.
 */
private predicate esapiIsValidData(Guard g, Expr e, boolean branch) {
  branch = true and
  exists(MethodAccess ma | ma.getMethod() instanceof EsapiIsValidMethod |
    g = ma and
    e = ma.getArgument(1)
  )
}

/**
 * Taint tracking for data that crosses a trust boundary.
 */
module TrustBoundaryConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) { source instanceof TrustBoundaryViolationSource }

  predicate isAdditionalFlowStep(DataFlow::Node n1, DataFlow::Node n2) {
    n2.asExpr().(MethodAccess).getQualifier() = n1.asExpr()
  }

  predicate isBarrier(DataFlow::Node node) {
    node instanceof TrustBoundaryValidationSanitizer or
    node.getType() instanceof HttpServletSession or
    node.asExpr()
        .(MethodAccess)
        .getMethod()
        .hasQualifiedName("javax.servlet.http", "HttpServletRequest", "getMethod")
  }

  predicate isSink(DataFlow::Node sink) { sink instanceof TrustBoundaryViolationSink }
}

/**
 * Taint-tracking flow for values which cross a trust boundary.
 */
module TrustBoundaryFlow = TaintTracking::Global<TrustBoundaryConfig>;
