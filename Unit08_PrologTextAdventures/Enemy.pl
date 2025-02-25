enemy('Dragon', 50, 10). % Name, Health, Damage
enemy('Goblin', 20, 5).
enemy('Orc', 30, 7).
enemy('Troll', 40, 8).
enemy('Skeleton', 15, 4).
enemy('Zombie', 25, 6).

% This rule tells if an enemy is in the same place as the player
enemyIsThere(Place) :-
    random(1, 3, RandomNumber),
    RandomNumber =:= 1,
    enemy(Enemy, _, _),
    iAmAt(Place),
    asserta(at(enemy(Enemy, _, _), Place)), !.

% This rule tells how to attack an enemy
attack(Enemy) :-
    player(_, _, PlayerHealth),
    enemy(Enemy, EnemyHealth, EnemyDamage),
    NewPlayerHealth is PlayerHealth - EnemyDamage,
    NewEnemyHealth is EnemyHealth - 10,
    retract(player(Name, Place, PlayerHealth)),
    asserta(player(Name, Place, NewPlayerHealth)),
    retract(enemy(Enemy, EnemyHealth, EnemyDamage)),
    asserta(enemy(Enemy, NewEnemyHealth, EnemyDamage)),
    write('You attacked the '), write(Enemy), write(' and dealt 10 damage.'), nl,
    write('The '), write(Enemy), write(' attacked you and dealt '), write(EnemyDamage), write(' damage.'), nl,
    write('Your health is now '), write(NewPlayerHealth), nl,
    write('The '), write(Enemy), write(' health is now '), write(NewEnemyHealth), nl.