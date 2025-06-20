/*
 * Copyright ©2016. Created by P. Bauer (p.bauer@htl-leonding.ac.at),
 * Department of Informatics and Media Technique, HTBLA Leonding, 
 * Limesstr. 12 - 14, 4060 Leonding, AUSTRIA. All Rights Reserved. Permission
 * to use, copy, modify, and distribute this software and its documentation
 * for educational, research, and not-for-profit purposes, without fee and
 * without a signed licensing agreement, is hereby granted, provided that the
 * above copyright notice, this paragraph and the following two paragraphs
 * appear in all copies, modifications, and distributions. Contact the Head of
 * Informatics and Media Technique, HTBLA Leonding, Limesstr. 12 - 14,
 * 4060 Leonding, Austria, for commercial licensing opportunities.
 * 
 * IN NO EVENT SHALL HTBLA LEONDING BE LIABLE TO ANY PARTY FOR DIRECT,
 * INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST
 * PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
 * EVEN IF HTBLA LEONDING HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * HTBLA LEONDING SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY,
 * PROVIDED HEREUNDER IS PROVIDED "AS IS". HTBLA LEONDING HAS NO OBLIGATION
 * TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 */
package regex;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author P. Bauer (p.bauer@htl-leonding.ac.at)
 */
public class RegEx {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Example 1
        // Match a simple pattern
        // Pattern "bauer" to be matched in "bauer", "peter bauer"
        // Show that Matcher.find() is not idempotent
//        Pattern p = Pattern.compile("ba[ui]er");
//        Matcher m = p.matcher("peter bauer");
//        System.out.println("Pattern found: " + m.find());
//        System.out.println("Patter found: " + m.group());
//        System.out.println("Pattern starts at: " + m.start());

        // Example 2
        // Match example from last exercise
        // w in (a|b|c)* where w has (i + 1) b's (i >= 0)
        // Introduce forced start and end (^ and $)

        // Example 3
        // Simple character classes
        // Birma and Burma

        // Example 4
        // Character classes with ranges, e.g., [a-zA-Z]
        // Use string "Burma" and then "8urma"

        // Example 5
        // Predefined character classes
        // Any character ".", digits (\d), non-digits (\D), white space (\s)
        // non white space (\S), word (\w) and non words (\W)
        // Show that the escape character has to be double escaped in a string
        // Use the example from the slides: "text[\w\s]*important" on "Hey there, I am texting you some important news: DON’T PANIC!"
        // Use string "8irma" and try the above given classes
//        Matcher matcher = Pattern.compile("text[\\w\\s]*important")
//                .matcher("Hey there, I am texting you some important news: DON’T PANIC!");
//        System.out.println("Pattern found: " + matcher.find());
//        System.out.println("Pattern found: " + matcher.group());

        // Example 6
        // Quantifiers: ? (optional), {n} (repeat n times), {m,n} (repeat at
        // least m and at most n times
        Pattern p = Pattern.compile("</?p>");
        Matcher m = p.matcher("</p>");
        System.out.println("Pattern found: " + m.find());

    }

}
