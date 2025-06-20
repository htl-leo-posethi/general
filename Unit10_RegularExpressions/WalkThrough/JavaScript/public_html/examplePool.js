// assert(regex.test("abledeblanzen"), "ok");
// assert(regex.test("blue"), "ok");
//
// assert("blue".match(regex) != null, "dudu");
// regex = /^(0|1)*(00|01)$/;
// assert(regex.test("01"), "ok");
// assert(regex.test("00"), "ok");
// assert(!regex.test(""), "not ok");
// assert(!regex.test("10"), "not ok");
// assert(regex.test("100"), "ok");
//
// regex = /^B[A-Za-z]rma$/;
// assert(regex.test("B[rma"), "ok");
// assert(regex.test("Birma"), "ok");
//
// regex = /^B[iu\[]rma$/;
// assert(regex.test("B[rma"), "ok");
//
// Match <h1>, <h2>, ..., <h>6 start tags
//    var regex = /h[123456]/;
//    assert(regex.test("h1"), "Match");
//    assert(regex.test("h2"), "Match");
//    assert(regex.test("h7"), "Match");

// Short cut for character classes
// match again header start tags
//    assert(/h[1-6]/.test("h1"), "Match");
//    assert(/h[1-6]/.test("h6"), "Match");
//    assert(/h[1-6]/.test("h7"), "Match");

// Decimal digits
// assert(/\d/.test("5"), "a digit");
//
// assert(/\D/.test("%"), "a non-digit");
//
// assert(/\w/.test("5"), "a word character"); // [A-Za-Z0-9_]
//
// assert(/\W/.test("5"), "a non-word character");
//
// Ranged quantifier {min occurance, max occurance}
// Simple phone number match
//     assert(/\d{4,4}\/\d{6,8}/.test("0732/916644"), "Match");

// Optional elements and escaping meta characters
// Match start as well as end tag of html table element
//    var regex = /<\/?table>/;
//    assert(regex.test("<table>"), "Table start");
//    assert(regex.test("</table>"), "Table end");

// Ranged quantifier
// Simplified e-mail address validation
