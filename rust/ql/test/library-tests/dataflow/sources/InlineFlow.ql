import rust
import codeql.rust.dataflow.DataFlow
import codeql.rust.Concepts
import utils.InlineFlowTest

/**
 * Configuration for flow from any threat model source to an argument of a function called `sink`.
 */
module MyFlowConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) { source instanceof ThreatModelSource }

  predicate isSink(DataFlow::Node sink) {
    any(CallExpr call | call.getExpr().(PathExpr).getPath().toString() = "sink")
        .getArgList()
        .getAnArg() = sink.asExpr()
  }
}

module MyFlowTest = TaintFlowTest<MyFlowConfig>;

import MyFlowTest
