// generated by codegen/codegen.py
import codeql.swift.elements.stmt.LabeledConditionalStmt
import codeql.swift.elements.stmt.Stmt

class IfStmtBase extends @if_stmt, LabeledConditionalStmt {
  override string toString() { result = "IfStmt" }

  Stmt getThen() {
    exists(Stmt x |
      if_stmts(this, x) and
      result = x.resolve()
    )
  }

  Stmt getElse() {
    exists(Stmt x |
      if_stmt_elses(this, x) and
      result = x.resolve()
    )
  }
}
