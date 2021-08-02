import java
private import semmle.code.java.dataflow.FlowSteps
private import semmle.code.java.dataflow.ExternalFlow

// TODO Is this heuristic too broad?
predicate isInterestingAPI(Callable call) {
  call.getNumberOfParameters() > 0 and
  not (
    call.getReturnType() instanceof VoidType or
    call.getReturnType() instanceof PrimitiveType or
    call.getReturnType() instanceof BoxedType
  )
}

// TODO [bm] Fails to detect Collection flow yet (e.g. Map#put)
string supportKind(Callable api) {
  if api instanceof TaintPreservingCallable
  then result = "taint-preserving"
  else
    if
      summaryModel(api.getCompilationUnit().getPackage().toString(),
        api.getDeclaringType().toString(), _, api.getName(), _, _, _, _, _)
    then result = "summary"
    else
      if
        sinkModel(api.getCompilationUnit().getPackage().toString(),
          api.getDeclaringType().toString(), _, api.getName(), _, _, _, _)
      then result = "sink"
      else
        if
          sourceModel(api.getCompilationUnit().getPackage().toString(),
            api.getDeclaringType().toString(), _, api.getName(), _, _, _, _)
        then result = "source"
        else result = "?"
}
