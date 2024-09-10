// generated by codegen
/**
 * This module provides the generated definition of `BlockExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.generated.Synth
private import codeql.rust.generated.Raw
import codeql.rust.elements.BlockExprBase
import codeql.rust.elements.Label

/**
 * INTERNAL: This module contains the fully generated definition of `BlockExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::BlockExpr` class directly.
   * Use the subclass `BlockExpr`, where the following predicates are available.
   */
  class BlockExpr extends Synth::TBlockExpr, BlockExprBase {
    override string getAPrimaryQlClass() { result = "BlockExpr" }

    /**
     * Gets the label of this block expression, if it exists.
     */
    Label getLabel() {
      result =
        Synth::convertLabelFromRaw(Synth::convertBlockExprToRaw(this).(Raw::BlockExpr).getLabel())
    }

    /**
     * Holds if `getLabel()` exists.
     */
    final predicate hasLabel() { exists(this.getLabel()) }
  }
}
