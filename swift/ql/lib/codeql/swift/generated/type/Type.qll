// generated by codegen/codegen.py
import codeql.swift.elements.Element
import codeql.swift.elements.type.Type

class TypeBase extends @type, Element {
  string getName() { types(this, result, _) }

  Type getCanonicalType() {
    exists(Type x |
      types(this, _, x) and
      result = x.resolve()
    )
  }
}
