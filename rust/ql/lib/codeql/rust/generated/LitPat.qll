// generated by codegen
/**
 * This module provides the generated definition of `LitPat`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.generated.Synth
private import codeql.rust.generated.Raw
import codeql.rust.elements.Expr
import codeql.rust.elements.Pat

/**
 * INTERNAL: This module contains the fully generated definition of `LitPat` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A literal pattern. For example:
   * ```
   * match x {
   *     42 => "ok",
   *     _ => "fail",
   * }
   * ```
   * INTERNAL: Do not reference the `Generated::LitPat` class directly.
   * Use the subclass `LitPat`, where the following predicates are available.
   */
  class LitPat extends Synth::TLitPat, Pat {
    override string getAPrimaryQlClass() { result = "LitPat" }

    /**
     * Gets the expression of this lit pat.
     */
    Expr getExpr() {
      result = Synth::convertExprFromRaw(Synth::convertLitPatToRaw(this).(Raw::LitPat).getExpr())
    }
  }
}
