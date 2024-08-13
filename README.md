# Interpolacja wielomianowa

Progam został napisany w języku R. W środowisku RStudio. Praca powstała w celu zaliczenia przedmiotu na studiach.

Interpolacja wielomianowa to metoda numeryczna, która służy do przybliżania funkcji wielomianem stopnia n.

Jest to przydatna metoda do działań na funkcjach, ponieważ łatwiej pracuje się na wielomianie niż na dowolnej funkcji 
(między innymi np liczenie pochochodnych jest o wiele łatwiejsze). W szczególności stosujemy interpolację, jeżeli nie znamy wzoru na pierwotną funkcję, 
a jedynie znamy jej kilka punktów. Wtedy trakujemy je jako węzły wraz z wartościami. Wyznaczamy wielomian interpolujący dzięki któremu możemy 
przybliżyć wartość pierwotnej nieznanej funkcji w dowolonym punkcie należącym do dziedziny w której przybliżamy funkcję.

Nie każdą funkcję jesteśmy w stanie przybliżyć wielomianem interpolacyjnym, jako założenie traktuje się tutaj twierdzenie Weierstrassa: 
funkcja musi być ciągła i określona na przedziale domkniętym [a,b]. Zatem jak mamy podane punkty to musimy założyć, że funkcja na tym odcinku jest ciągła.

Wielomian interpolacyny jest jednoznaczny, znaczy się, że nie znajdziemy innego wielomianu interpolacyjnego dla danej funkcji i jej węzłów. 

Program wykonuje interpolację korzystając ze wzoru interpolacyjnego Newtona. Mamy dwie opcje do wyboru, możemy wpisać węzły interpolacji funkcji, której
wzoru nie znamy lub sprawdzić jak program interpoluje funkcję xcos(x) porównjąc wartość funkcji do wartości wielomianu interpolacyjnego. Dodatkowo w drugiej
opcji możemy wybrać czy chcemy sami podać argumenty interpolacji (wartości zostaną obliczone automatycznie) czy też skorzystać z twierdzenia o optymalnym
doborze węzłów - program sam wyliczy odpowidnie węzły i ich wartości.

Pierwszym krokiem jest zdecydowanie którą opcję wybieramy, poprzez wykonanie polecania: 
print("Program dokonuje interpolacji funkcji: x*cos(x) lub takiej ktorej znamy tylko wezly, czyli argumenty i wartosci. W kolejnym kroku wskaz, co chcesz zrobic wpisujac opcje: funkcja lub wezly.")
program <- readline(prompt = "funkcja/wezly: ")
 
Najpierw puszczamy dwie pierwsze linijki kodu, program informuje nas co robi oraz pozwala na wybranie 
opcji 1 czyli znamy tylko węzły(wezly) lub 2 czyli porównanie prawdziwej wartości funkcji do wartości wielomianu interpolacyjnego dobranego na podstawie podanych
węzłów lub dobranych przez program (funkcja).

Po wpisaniu wezly lub funkcja, wykonujemy pozostałą część kodu.

1. Wersja, gdzie użytkownik wybrał program <- wezly
 
Można podstawić następujęce dane:

Przykład 1: #"Metody numeryczne w przykładach" Politechnika Lubelska

f(-2) = -1

f(-1) = 0

f(0) = 5

f(2) = 99

f(4) = -55

Przybliżona wartość:

W(3) = 104 

Przykład 2: #"Metody numeryczne w przykładach" Politechnika Lubelska

f(-4) = 2

f(-3) = -1

f(-1) = -37

f(0) = -58

f(2) = 464

f(4) = -3382

Przybliżona wartość:

W(3) = -61

2. Wersja, gdzie użytkownik wybrał program <- funkcja

Przykład 1: #własny

Stopień wielomianu = 11

Twierdzenie o opytmalnym doborze węzłów

Przedział: [-7,14], zatem d_d = -7 a d_g = 14

W(5) = 1.131973 # wartość przybliżona przez wielomian

f(5) = 1.418311  # wartość funkcji


Przykład 2: #własny

Stopień wielomianu = 10

Przedział: [-3,8] zatem d_d = -3 a d_g = 8

Twierdzenie o opytmalnym doborze węzłów

W(2.8) = -2.627525 # wartość przybliżona przez wielomian

f(2.8) = -2.638223 # wartość funkcji

Przykład 3: #własny

Stopień wielomianu = 10

Własne węzły: -3, -2, 0, 1, 2, 2.8, 3, 4, 6, 7, 8

W(7.5) = 2.719582 # wartość przybliżona przez wielomian

f(7.5) = 2.599765 # wartość funkcji
