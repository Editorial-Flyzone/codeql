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
 *       external/cwe/cwe-094
 *       external/cwe/cwe-095
 *       external/cwe/cwe-116
 */

import actions
import codeql.actions.security.ArgumentInjectionQuery
import ArgumentInjectionFlow::PathGraph

from ArgumentInjectionFlow::PathNode source, ArgumentInjectionFlow::PathNode sink
where
  ArgumentInjectionFlow::flowPath(source, sink) and
  inPrivilegedContext(sink.getNode().asExpr())
select sink.getNode(), source, sink,
  "Potential argument injection in $@ command, which may be controlled by an external user.", sink,
  sink.getNode().(ArgumentInjectionSink).getCommand()
