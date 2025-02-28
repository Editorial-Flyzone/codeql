// generated by codegen, do not edit
/**
 * This module provides the generated definition of `ParenExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.Attr
import codeql.rust.elements.Expr
import codeql.rust.elements.internal.ExprImpl::Impl as ExprImpl

/**
 * INTERNAL: This module contains the fully generated definition of `ParenExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A ParenExpr. For example:
   * ```rust
   * todo!()
   * ```
   * INTERNAL: Do not reference the `Generated::ParenExpr` class directly.
   * Use the subclass `ParenExpr`, where the following predicates are available.
   */
  class ParenExpr extends Synth::TParenExpr, ExprImpl::Expr {
    override string getAPrimaryQlClass() { result = "ParenExpr" }

    /**
     * Gets the `index`th attr of this paren expression (0-based).
     */
    Attr getAttr(int index) {
      result =
        Synth::convertAttrFromRaw(Synth::convertParenExprToRaw(this).(Raw::ParenExpr).getAttr(index))
    }

    /**
     * Gets any of the attrs of this paren expression.
     */
    final Attr getAnAttr() { result = this.getAttr(_) }

    /**
     * Gets the number of attrs of this paren expression.
     */
    final int getNumberOfAttrs() { result = count(int i | exists(this.getAttr(i))) }

    /**
     * Gets the expression of this paren expression, if it exists.
     */
    Expr getExpr() {
      result =
        Synth::convertExprFromRaw(Synth::convertParenExprToRaw(this).(Raw::ParenExpr).getExpr())
    }

    /**
     * Holds if `getExpr()` exists.
     */
    final predicate hasExpr() { exists(this.getExpr()) }
  }
}
