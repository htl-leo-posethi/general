/*
 * Small examples to show regexs in JavaScript
 * Copyright (C) 2014  Peter Bauer
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

window.onload = function() {
    var regex = /^blue$/;
    var otherRegEx = new RegExp("^(0|1)*(00|01)$");

    assert(regex.test("blue"), "Geht eh nicht");
    assert("0010".match(otherRegEx) != null, "Anders");
}
