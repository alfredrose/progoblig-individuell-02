#Legge til avhengigheter
include gdrive-sheets
include data-source
include shared-gdrive(
  "dcic-2021",
  "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")

#Definere variabler
unit-fuel-energy = 8
daily-travel-distance = 12
fuel-distance-unit = 6

energy-per-day = (daily-travel-distance / fuel-distance-unit) * unit-fuel-energy

#Hente tabellen fra Google Disk
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
sanitize komponent using string-sanitizer
sanitize energi using string-sanitizer
  end

#Funksjon for energiomregning
fun energi-to-number(str :: String) -> Number:

  doc: "If s is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => energy-per-day
  end
  
#Konvertering av energikolonnen
  where:
energi-to-number("") is energy-per-day
energi-to-number("48") is 48
end

#Energikolonnen tilordnes en ny tabell.
transform-energi-newtable = transform-column(kWh-wealthy-consumer-data, "energi", 
energi-to-number)

#Samling
sumtable = sum(transform-energi-newtable, "energi")

#Legge til totalsummen i tabellen
table-sum = table: komponent :: String, energi :: Number
  row: "sumtable", sumtable
end

ny-row = get-row(table-sum, 0)
add-row(transform-energi-newtable, ny-row)

#Dataverdiene visualiseres som et søylediagram.
bar-chart(transform-energi-newtable, "komponent", "energi")

