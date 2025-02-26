enemy('🐲', 'Dragon', 50, 10). % Icon, Name, Health, Damage
enemy('👺', 'Goblin', 20, 5).
enemy('👹', 'Ogre', 30, 7).
enemy('👽', 'Alien', 40, 8).
enemy('💀', 'Skeleton', 15, 4).
enemy('🧟', 'Zombie', 25, 6).

% Place an enemy with the probability of 30%
placeEnemyAt(Place) :-
    random(1, 3, RandomNumber),
    RandomNumber =:= 1,
    enemy(Icon, Enemy, Health, Damage),
    iAmAt(Place),
    asserta(at(enemy(Icon, Enemy, Health, Damage), Place)), !.

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