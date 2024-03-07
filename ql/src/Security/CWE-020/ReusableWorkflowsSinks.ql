/**
 * @name Reusable Workflow Sinks
 * @description Reusable Workflows passing parameters to an expression injection sink.
 * @kind path-problem
 * @problem.severity warning
 * @security-severity 9.3
 * @precision high
 * @id actions/reusable-wokflow-sinks
 * @tags actions
 *       model-generator
 *       external/cwe/cwe-020
 */

import actions
import codeql.actions.TaintTracking
import codeql.actions.dataflow.FlowSources
import codeql.actions.dataflow.ExternalFlow

private class ExpressionInjectionSink extends DataFlow::Node {
  ExpressionInjectionSink() {
    exists(Run e | e.getScript().getAnExpression() = this.asExpr()) or
    externallyDefinedSink(this, "expression-injection")
  }
}

private module MyConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    exists(ReusableWorkflow w | w.getAnInput() = source.asExpr())
  }

  predicate isSink(DataFlow::Node sink) { sink instanceof ExpressionInjectionSink }
}

module MyFlow = TaintTracking::Global<MyConfig>;

import MyFlow::PathGraph

from MyFlow::PathNode source, MyFlow::PathNode sink
where
  MyFlow::flowPath(source, sink) and
  source.getNode().getLocation().getFile() = sink.getNode().getLocation().getFile()
select sink.getNode(), source, sink, "Sink"
