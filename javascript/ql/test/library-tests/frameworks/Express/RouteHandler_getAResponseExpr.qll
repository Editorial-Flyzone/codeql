import javascript

query predicate test_RouteHandler_getAResponseExpr(Express::RouteHandler rh, HTTP::ResponseNode res) {
  res = rh.getAResponseNode()
}
