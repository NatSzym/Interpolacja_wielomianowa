#najpierw wykonujemy I CZESC kodu, wybieramy opcje, a nastepnie wykonujemy II CZESC kodu.

# I CZESC DO WYBORU OPCJI PROGRAMU
print("Program dokonuje interpolacji funkcji: x*cos(x) lub takiej ktorej znamy tylko wezly, czyli argumenty i wartosci. W kolejnym kroku wskaz, co chcesz zrobic wpisujac opcje: funkcja lub wezly.")
program <- readline(prompt = "funkcja/wezly: ")

# II CZESC DO WYKONANIA OPERACJI, PROGRAM WYBIERZE ODPOWIEDNIA CZESC ZA POMOCA FUNKCJI WARUNKOWEJ
# zdefiniowanie potrzebnych funkcji
wezly <- function(a,b,n) {
  x_w <- matrix(NA, 1, n+1)
  for ( i in 0:n) {
    x_w[1,i+1] <- (b-a)/2*cos((2*i+1)/(2*n+2)*pi)+(a+b)/2
  }
  return(x_w)
}

wartosci_wezlow <- function(x_w,n) {
  y_w <- matrix(NA, 1, n+1)
  for (i in 0:n){
    y_w[1,i+1] <- x_w[1,i+1]*cos(x_w[1,i+1])
  }
  return(y_w)
}

omega <- function(x,n,x_w){
  omega <- 1
  for (i in 1:n){
    omega <- omega*(x-x_w[i])
  }
  return(omega)
}

if (program == 'wezly'){
  d <- readline(prompt = "Podaj pierwszy wezel� interpolacji: ")
  d <- as.numeric(d)
  x_w <- c(d)
  while (TRUE){
    d <- readline(prompt = "Podaj kolejny wezel interpolacji. Jezeli chcesz skonczyc podawanie wpisz stop:")
    if (d != "stop"){
      d = as.numeric(d)
      x_w <- c(c(x_w),c(d))
    }
    else {
      break
    }
  }
  cat("Wezly interpolacji: ", x_w)
  
  d <- readline(prompt = "Podaj kolejno wartosci funkcji, w kolejno podanych wezlach: ")
  d <- as.numeric(d)
  y_w <- c(d)
  n <- length(x_w)-1
  for (i in 1:n){
    d <- readline(prompt = "Podaj kolejno wartosci funkcji, w kolejno podanych wezlach: ")
    d <- as.numeric(d)
    y_w <- c(c(y_w),c(d))
  }
  cat("Wartosci funkcji w wezlach interpolacyjnych: ",y_w)
  
  x <- readline(prompt = "Podaj argument, w ktorym chcesz poznac przyblizona wartosc funkcji: ")
  x <- as.numeric(x)
  
  while (x < min(x_w) || x > max(x_w)){
    x <- readline(prompt = "Blad! Podaj argument, w ktorym chcesz poznac przyblizona wartosc funkcji: ")
    x <- as.numeric(x)
  }
  
  macierz <- matrix(0, n+1, n+1)
  macierz[,1] <- y_w
  
  for(k in 2:(n+1)){
    s <- n+2-k
    for(w in 1:s){
      macierz[w,k] <- (macierz[w+1,k-1]-macierz[w,k-1])/(x_w[w+k-1]-x_w[w])
    }
  }
  
  w_d <- macierz[1,1]
  for(i in 2:(n+1)){
    w_d <- w_d+macierz[1,i]*omega(x,i-1,x_w)
  }
  cat("Przyblizona wartosc funcji dla argumentu", x, "wynosi: ", w_d,"\n")
  print("KONIEC")
} else{
  n <- readline(prompt = "Podaj stopien wielomianu interpolacyjnego: ")
  n <- as.numeric(n)
  decyzja <- readline(prompt = "Czy chcesz podac wezly? TAK/NIE. Jezeli napiszesz NIE program skorzysta z twierdzenia o optymalnym doborze wezlow:")
  if(decyzja == "TAK"){
    d <- readline(prompt = "Podaj pierwszy wezel interpolacji: ")
    d <- as.numeric(d)
    x_w <- c(d)
    for(i in 1:n){
      d <- readline(prompt = "Podaj kolejny wezel interpolacji: ")
      d = as.numeric(d)
      x_w <- c(c(x_w),c(d))
    }
    x_w <- matrix(x_w, 1, n+1)
  }else{
    d_d <- readline(prompt = "Podaj na jakim domknietym przedziale bedziemy przyblizac funkcje. Przedzial argumentow zaczynamy: ")
    d_d <- as.numeric(d_d)
    d_g <- readline(prompt = "Przedzia� argumentow konczymy na: ")
    d_g <- as.numeric(d_g)
    while(d_d > d_g){
      print("Blad. Pamietaj, ze przedzial zaczynamy mniejszym argumentem.")
      d_d <- readline(prompt = "Podaj na jakim domknietym przedziale bedziemy przyblizac funkcje. Przedzial argumentow zaczynamy: ")
      d_d <- as.numeric(d_d)
      d_g <- readline(prompt = "Przedzia� argumentow konczymy na: ")
      d_g <- as.numeric(d_g)
    }
    x_w <- wezly(d_d,d_g,n)
  }
  y_w <- wartosci_wezlow(x_w,n)
  
  cat("Wezly interpolacji: ", x_w, "\n")
  
  cat("Wartosci funkcji w wezlach interpolacyjnych: ",y_w, "\n")
  
  macierz <- matrix(0, n+1, n+1)
  macierz[,1] <- y_w
  
  for(k in 2:(n+1)){
    s <- n+2-k
    for(w in 1:s){
      macierz[w,k] <- (macierz[w+1,k-1]-macierz[w,k-1])/(x_w[w+k-1]-x_w[w])
    }
  }
  x <- readline(prompt = "Podaj argument, w ktorym chcesz poznac przyblizona wartosc funkcji: ")
  x <- as.numeric(x)
  
  if(decyzja == "TAK"){
    while (x < min(x_w) || x > max(x_w)){
      x <- readline(prompt = "Blad! Podaj argument, w ktorym chcesz poznac przyblizona wartosc funkcji: ")
      x <- as.numeric(x)
    }
  }else{
    while (x < d_d || x > d_g){
      x <- readline(prompt = "Blad! Podaj argument, w ktorym chcesz poznac przyblizona wartosc funkcji: ")
      x <- as.numeric(x)
    }
  }
  
  w_d <- macierz[1,1]
  for(i in 2:(n+1)){
    w_d <- w_d+macierz[1,i]*omega(x,i-1,x_w)
  }
  y_p <- x*cos(x)
  cat("Korzystajac ze wzoru interpolacyjnego Newtona przyblizona wartosc funcji dla argumentu", x, "wynosi: ", w_d, "a prawdziwa wartosc wynosi: ",y_p, "\n")
  print("KONIEC")
}
