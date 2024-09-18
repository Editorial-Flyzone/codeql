// generated by codegen, do not edit
/**
 * This module provides the public class `CallExpr`.
 */

private import internal.CallExprImpl
import codeql.rust.elements.Expr

/**
 * A function call expression. For example:
 * ```rust
 * foo(42);
 * foo::<u32, u64>(42);
 * foo[0](42);
 * foo(1) = 4;
 * ```
 */
final class CallExpr = Impl::CallExpr;
