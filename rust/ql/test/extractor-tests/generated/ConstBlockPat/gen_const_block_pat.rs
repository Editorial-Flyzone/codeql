// generated by codegen

fn test_const_block_pat() -> () {
    // A const block pattern. For example:
    match x {
        const { 1 + 2 + 3} => "ok",
        _ => "fail",
    };
}
