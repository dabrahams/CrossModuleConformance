# Swift Cross-Module Conformance Demo

This little example demonstrates how Swift deals with conflicting conformances
across modules.  There appears to be some dependence on import order, among
other things.  It's easy enough to create inconsistent semantics; just comment
out "import A" from "AB.swift".
