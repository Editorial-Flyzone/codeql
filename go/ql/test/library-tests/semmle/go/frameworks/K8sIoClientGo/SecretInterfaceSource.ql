import go
import semmle.go.dataflow.ExternalFlow
import ModelValidation
import utils.test.InlineExpectationsTest

module K8sIoApimachineryPkgRuntimeTest implements TestSig {
  string getARelevantTag() { result = "KsIoClientGo" }

  predicate hasActualResult(Location location, string element, string tag, string value) {
    exists(K8sIoClientGo::SecretInterfaceSource source |
      source.getLocation() = location and
      element = source.toString() and
      value = "" and
      tag = "KsIoClientGo"
    )
  }
}

import MakeTest<K8sIoApimachineryPkgRuntimeTest>
