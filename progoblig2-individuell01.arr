include image 

Norsk-flagg = put-image(
  rectangle(600, 25, "solid", "darkblue"),
  15, 100,
  
  put-image(
    rectangle(25, 600, "solid", "darkblue"),
    110, 15,
    
    put-image(
      rectangle(50, 600, "solid", "white"),
      110, 15,
      
      put-image(
        rectangle(600, 50, "solid", "white"),
        15, 100,
        rectangle(300, 200, "solid", "red"))))) 

Danmark-flagg = put-image(
  rectangle(600, 25, "solid", "white"),
  15, 100,
  put-image(
    rectangle(25, 600, "solid", "white"),
  110, 15,
    rectangle(300, 200, "solid", "crimson")))

Sverige-flagg = put-image(
  rectangle(600, 30, "solid", "gold"),
  15, 100,
  put-image(
    rectangle(30, 600, "solid", "gold"),
    110, 15,
    rectangle(300, 200, "solid", "dark-blue")))

Finland-flagg = put-image(
  rectangle(600, 40, "solid", "dark-blue"),
  15, 110,
  put-image(
    rectangle(40, 600, "solid", "dark-blue"),
  110, 15,
    rectangle(300, 200, "solid", "white")))

Island-flagg = put-image(
  rectangle(20, 600, "solid", "fire-brick"),
  110, 15,
  put-image(
    rectangle(600, 20, "solid", "fire-brick"),
    15, 100,
    put-image(
      rectangle(40, 600, "solid", "white"),
      110, 15,
      put-image(
        rectangle(600, 40, "solid", "white"),
        15, 100,
        rectangle(300, 200, "solid", "royal-blue")))))

Faroyene-flagg = put-image(
  rectangle(300, 20, "solid", "red"),
  150, 100,
  put-image(
    rectangle(20, 600, "solid", "red"),
    110, 20,
  put-image(
      rectangle(600, 40, "solid", "royal-blue"),
      15, 100,
  put-image(
        rectangle(40, 600, "solid", "royal-blue"),
        110, 15,
        rectangle(300, 200, "solid", "white")))))


fun landFlagg(land :: String) -> Image:
  if land == "Norge":
    Norsk-flagg
  else if land == "Danmark":
    Danmark-flagg
  else if land == "Sverige":
    Sverige-flagg
  else if land == "Finland":
    Finland-flagg
  else if land == "Island":
    Island-flagg
  else if land == "Færøyene":
    Faroyene-flagg
  else:
    text("Ukjent land", 20, "black")
  end
end

# Eksempel bruk
landFlagg("Norge")
