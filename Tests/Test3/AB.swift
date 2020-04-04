import C

let ab = X().identity // without import C we get error: use of unresolved
                      // identifier 'X'

let idA = X().idA // and yet we haven't imported A, which should be needed for
                  // the definition of idA!
