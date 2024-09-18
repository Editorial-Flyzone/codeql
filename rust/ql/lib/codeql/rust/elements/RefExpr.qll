// generated by codegen, do not edit
/**
 * This module provides the public class `RefExpr`.
 */

private import internal.RefExprImpl
import codeql.rust.elements.Expr

/**
 * A reference expression. For example:
 * ```rust
 *     let ref_const = &foo;
 *     let ref_mut = &mut foo;
 *     let raw_const: &mut i32 = &raw const foo;
 *     let raw_mut: &mut i32 = &raw mut foo;
 * ```
 */
final class RefExpr = Impl::RefExpr;
