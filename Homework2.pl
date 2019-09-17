% Armand Nasseri - 912679383

/* Exercise 1 */

% 1) Syntax Error: Variable starts with a number.

% 2) Syntax Error: Variable Language is capitalized.

% 3) Syntax Error: The fact is missing a period.

% 4) Syntax Error: No period, and variable is capitalized.

% 5) Syntax Error: Variable starts with a number.

% 6) Syntax Error: Space in between second variable.

/* Exercise 2 */ 
% quadralingual
speaks(jane, arabic).
speaks(jane, nahuatl).
speaks(jane, urdu).
speaks(jane, tlingit).
speaks(whitney, arabic).
speaks(whitney, nahuatl).
speaks(whitney, urdu).
speaks(whitney, tlingit).

% trilingual
speaks(tim, arabic).
speaks(tim, nahuatl).
speaks(tim, urdu).
speaks(tom, arabic).
speaks(tom, nahuatl).
speaks(tom, urdu).


% bilingual
speaks(frank, hawaiian).
speaks(frank, english).
speaks(john, hawaiian).
speaks(john, english).

% monolingual
speaks(tony, english).
speaks(jimmy, urdu).


% quadralingual predicate
% Want these to be variables
% Check if person X speaks 4 languages

quadralingual(X) :- 
     speaks(X, Y1),  
     speaks(X, Y2),  
     speaks(X, Y3), 
     speaks(X, Y4), not(Y3 = Y1), not(Y1 = Y2), not(Y4 = Y3), not(Y2 = Y3), not(Y2 = Y4), not(Y1 = Y4).

% 6 combinations

  
    


