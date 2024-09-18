// generated by codegen, do not edit
/**
 * This module provides the generated definition of `Function`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.DeclarationImpl::Impl as DeclarationImpl
import codeql.rust.elements.Expr

/**
 * INTERNAL: This module contains the fully generated definition of `Function` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A function declaration. For example
   * ```rust
   * fn foo(x: u32) -> u64 {(x + 1).into()}
   * ```
   * A function declaration within a trait might not have a body:
   * ```rust
   * trait Trait {
   *     fn bar();
   * }
   * ```
   * INTERNAL: Do not reference the `Generated::Function` class directly.
   * Use the subclass `Function`, where the following predicates are available.
   */
  class Function extends Synth::TFunction, DeclarationImpl::Declaration {
    override string getAPrimaryQlClass() { result = "Function" }

    /**
     * Gets the name of this function.
     */
    string getName() { result = Synth::convertFunctionToRaw(this).(Raw::Function).getName() }

    /**
     * Gets the body of this function.
     */
    Expr getBody() {
      result =
        Synth::convertExprFromRaw(Synth::convertFunctionToRaw(this).(Raw::Function).getBody())
    }
  }
}
