// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `AutoClosureExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.internal.ClosureExprImpl::Impl as ClosureExprImpl

/**
 * INTERNAL: This module contains the fully generated definition of `AutoClosureExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::AutoClosureExpr` class directly.
   * Use the subclass `AutoClosureExpr`, where the following predicates are available.
   */
  class AutoClosureExpr extends Synth::TAutoClosureExpr, ClosureExprImpl::ClosureExpr {
    override string getAPrimaryQlClass() { result = "AutoClosureExpr" }
  }
}
