// generated by codegen, do not edit
/**
 * This module provides the public class `TupleStructPat`.
 */

private import internal.TupleStructPatImpl
import codeql.rust.elements.Pat
import codeql.rust.elements.PathAstNode

/**
 * A tuple struct pattern. For example:
 * ```rust
 * match x {
 *     Tuple("a", 1, 2, 3) => "great",
 *     Tuple(.., 3) => "fine",
 *     Tuple(..) => "fail",
 * };
 * ```
 */
final class TupleStructPat = Impl::TupleStructPat;
