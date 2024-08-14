import 'dummy';

function t1() {
    function target(...rest) {
        sink(rest[0]); // $ hasValueFlow=t1.1
        sink(rest[1]); // $ hasValueFlow=t1.2
        sink(rest.join(',')); // $ hasTaintFlow=t1.1 hasTaintFlow=t1.2
    }
    target(source('t1.1'), source('t1.2'));
}

function t2() {
    function target(x, ...rest) {
        sink(x); // $ hasValueFlow=t2.1
        sink(rest.join(',')); // $ hasTaintFlow=t2.2 hasTaintFlow=t2.3
    }
    target(source('t2.1'), source('t2.2'), source('t2.3'));
}

function t3() {
    function finalTarget(x, y, z) {
        sink(x); // $ hasValueFlow=t3.1
        sink(y); // $ hasValueFlow=t3.2
        sink(z); // $ hasValueFlow=t3.3
    }
    function target(...rest) {
        finalTarget(...rest);
    }
    target(source('t3.1'), source('t3.2'), source('t3.3'));
}

function t4() {
    function finalTarget(w, x, y, z) {
        sink(w); // $ hasValueFlow=t4.0
        sink(x); // $ hasValueFlow=t4.1
        sink(y); // $ hasValueFlow=t4.2
        sink(z); // $ hasValueFlow=t4.3
    }
    function target(...rest) {
        finalTarget(source('t4.0'), ...rest);
    }
    target(source('t4.1'), source('t4.2'), source('t4.3'));
}

function t5() {
    function finalTarget(w, x, y, z) {
        sink(w); // $ hasValueFlow=t5.0
        sink(x); // $ hasValueFlow=t5.1
        sink(y); // $ hasValueFlow=t5.2
        sink(z); // $ hasValueFlow=t5.3
    }
    function target(array) {
        finalTarget(source('t5.0'), ...array);
    }
    target([source('t5.1'), source('t5.2'), source('t5.3')]);
}

function t6() {
    function target(x) {
        sink(x); // $ hasValueFlow=t6.1
        sink(arguments[0]);// $ hasValueFlow=t6.1
        sink(arguments[1]);// $ hasValueFlow=t6.2
        sink(arguments[2]);// $ hasValueFlow=t6.3
    }
    target(source('t6.1'), source('t6.2'), source('t6.3'));
}

function t7() {
    function finalTarget(x, y, z) {
        sink(x); // $ hasValueFlow=t7.1
        sink(y); // $ hasValueFlow=t7.2
        sink(z); // $ hasValueFlow=t7.3
    }
    function target() {
        finalTarget(...arguments);
    }
    target(source('t7.1'), source('t7.2'), source('t7.3'));
}

function t8() {
    function finalTarget(x, y, z) {
        sink(x); // $ hasValueFlow=t8.1 SPURIOUS: hasValueFlow=t8.3 hasValueFlow=t8.4
        sink(y); // $ hasValueFlow=t8.2 SPURIOUS: hasValueFlow=t8.3 hasValueFlow=t8.4
        sink(z); // $ hasValueFlow=t8.3 SPURIOUS: hasValueFlow=t8.3 hasValueFlow=t8.4
    }
    function target(array1, array2) {
        finalTarget(...array1, ...array2);
    }
    target([source('t8.1'), source('t8.2')], [source('t8.3'), source('t8.4')]);
}

function t9() {
    function finalTarget(x, y, z) {
        sink(x); // $ hasValueFlow=t9.1
        sink(y); // $ hasValueFlow=t9.2
        sink(z); // $ hasValueFlow=t9.3
    }
    function target() {
        finalTarget.apply(undefined, arguments);
    }
    target(source('t9.1'), source('t9.2'), source('t9.3'));
}

function t10() {
    function finalTarget(x, y, z) {
        sink(x); // $ hasValueFlow=t10.1
        sink(y); // $ hasValueFlow=t10.2
        sink(z); // $ hasValueFlow=t10.3
    }
    function target(...rest) {
        finalTarget.apply(undefined, rest);
    }
    target(source('t10.1'), source('t10.2'), source('t10.3'));
}

function t11() {
    function target(x, y) {
        sink(x); // $ MISSING: hasTaintFlow=t11.1
        sink(y); // $ MISSING: hasTaintFlow=t11.1
    }
    target(...source('t11.1'));
}

function t12() {
    function target(x, y) {
        sink(x);
        sink(y); // $ MISSING: hasTaintFlow=t12.1
    }
    target("safe", ...source('t12.1'));
}

function t13() {
    function target(x, y, ...rest) {
        sink(x);
        sink(y); // $ MISSING: hasTaintFlow=t13.1
        sink(rest); // $ MISSING: hasTaintFlow=t13.1
        sink(rest[0]); // $ MISSING: hasTaintFlow=t13.1
    }
    target("safe", ...source('t13.1'));
}
