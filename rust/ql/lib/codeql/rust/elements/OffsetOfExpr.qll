// generated by codegen, do not edit
/**
 * This module provides the public class `OffsetOfExpr`.
 */

private import internal.OffsetOfExprImpl
import codeql.rust.elements.Expr
import codeql.rust.elements.TypeRef

/**
 *  An `offset_of` expression. For example:
 * ```rust
 * builtin # offset_of(Struct, field);
 * ```
 */
final class OffsetOfExpr = Impl::OffsetOfExpr;
