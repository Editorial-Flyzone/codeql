// generated by codegen

fn test_box_pat() -> () {
    // A box pattern. For example:
    match x {
        box Some(y) => y,
        box None => 0,
    };
}
