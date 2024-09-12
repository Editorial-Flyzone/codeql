// generated by codegen
/**
 * This module provides the generated definition of `RecordPat`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.generated.Synth
private import codeql.rust.generated.Raw
import codeql.rust.elements.Pat
import codeql.rust.elements.RecordFieldPat
import codeql.rust.elements.Unimplemented

/**
 * INTERNAL: This module contains the fully generated definition of `RecordPat` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A record pattern. For example:
   * ```
   * match x {
   *     Foo { a: 1, b: 2 } => "ok",
   *     Foo { .. } => "fail",
   * }
   * ```
   * INTERNAL: Do not reference the `Generated::RecordPat` class directly.
   * Use the subclass `RecordPat`, where the following predicates are available.
   */
  class RecordPat extends Synth::TRecordPat, Pat {
    override string getAPrimaryQlClass() { result = "RecordPat" }

    /**
     * Gets the path of this record pat, if it exists.
     */
    Unimplemented getPath() {
      result =
        Synth::convertUnimplementedFromRaw(Synth::convertRecordPatToRaw(this)
              .(Raw::RecordPat)
              .getPath())
    }

    /**
     * Holds if `getPath()` exists.
     */
    final predicate hasPath() { exists(this.getPath()) }

    /**
     * Gets the `index`th argument of this record pat (0-based).
     */
    RecordFieldPat getArg(int index) {
      result =
        Synth::convertRecordFieldPatFromRaw(Synth::convertRecordPatToRaw(this)
              .(Raw::RecordPat)
              .getArg(index))
    }

    /**
     * Gets any of the arguments of this record pat.
     */
    final RecordFieldPat getAnArg() { result = this.getArg(_) }

    /**
     * Gets the number of arguments of this record pat.
     */
    final int getNumberOfArgs() { result = count(int i | exists(this.getArg(i))) }

    /**
     * Holds if this record pat has ellipsis.
     */
    predicate hasEllipsis() { Synth::convertRecordPatToRaw(this).(Raw::RecordPat).hasEllipsis() }
  }
}
