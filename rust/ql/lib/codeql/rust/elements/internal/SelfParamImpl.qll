// generated by codegen, remove this comment if you wish to edit this file
/**
 * This module provides a hand-modifiable wrapper around the generated class `SelfParam`.
 *
 * INTERNAL: Do not use.
 */

private import codeql.rust.elements.internal.generated.SelfParam

/**
 * INTERNAL: This module contains the customizable definition of `SelfParam` and should not
 * be referenced directly.
 */
module Impl {
  /**
   * A `self` parameter. For example `self` in:
   * ```rust
   * struct X;
   * impl X {
   *   fn one(&self) {}
   *   fn two(&mut self) {}
   *   fn three(self) {}
   *   fn four(mut self) {}
   *   fn five<'a>(&'a self) {}
   * }
   * ```
   */
  class SelfParam extends Generated::SelfParam { }
}
