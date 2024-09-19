/**
 * @name Argument injection
 * @description Passing unsanitized user input to a command that will run it as a subprocess.
 * @kind path-problem
 * @problem.severity error
 * @security-severity 9
 * @precision very-high
 * @id actions/argument-injection/critical
 * @tags actions
 *       security
 *       external/cwe/cwe-088
 */

import actions
import codeql.actions.security.ArgumentInjectionQuery
import ArgumentInjectionFlow::PathGraph
import codeql.actions.security.ControlChecks

from ArgumentInjectionFlow::PathNode source, ArgumentInjectionFlow::PathNode sink
where
  ArgumentInjectionFlow::flowPath(source, sink) and
  inPrivilegedContext(sink.getNode().asExpr()) and
  not exists(ControlCheck check |
    check
        .protects(sink.getNode().asExpr(),
          source.getNode().asExpr().getEnclosingJob().getATriggerEvent(), "argument-injection")
  )
select sink.getNode(), source, sink,
  "Potential argument injection in $@ command, which may be controlled by an external user.", sink,
  sink.getNode().(ArgumentInjectionSink).getCommand()
