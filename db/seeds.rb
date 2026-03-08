# Categories
categories = {}
{
  "Ubrania" => nil, "Kosmetyki" => nil, "Elektronika" => nil,
  "Dokumenty" => nil, "Akcesoria" => nil, "Obuwie" => nil,
  "Jedzenie" => nil, "Sprzęt" => nil
}.each_key do |name|
  categories[name] = Category.find_or_create_by!(name: name)
end

# Tags
tags = {}
[
  "Plaża", "Miasto", "Góry", "Zima", "Lato", "Camping",
  "Biznes", "Weekend", "Długi wyjazd", "Deszcz", "Elegancko"
].each do |name|
  tags[name] = Tag.find_or_create_by!(name: name)
end

# Helper to create items with tags
def seed_item(name, category, tag_names, tags)
  item = Item.find_or_create_by!(name: name, category: category)
  tag_names.each do |tag_name|
    item.item_tags.find_or_create_by!(tag: tags[tag_name])
  end
  item
end

# Ubrania
seed_item("Koszulki", categories["Ubrania"], ["Lato", "Plaża", "Miasto", "Góry", "Camping", "Weekend"], tags)
seed_item("Jeansy", categories["Ubrania"], ["Miasto", "Weekend", "Długi wyjazd"], tags)
seed_item("Szorty", categories["Ubrania"], ["Lato", "Plaża", "Góry", "Camping"], tags)
seed_item("Bielizna", categories["Ubrania"], ["Plaża", "Miasto", "Góry", "Zima", "Lato", "Camping", "Biznes", "Weekend", "Długi wyjazd"], tags)
seed_item("Skarpetki", categories["Ubrania"], ["Miasto", "Góry", "Zima", "Camping", "Biznes", "Weekend", "Długi wyjazd"], tags)
seed_item("Sweter", categories["Ubrania"], ["Zima", "Miasto", "Góry", "Długi wyjazd", "Deszcz"], tags)
seed_item("Kurtka przeciwdeszczowa", categories["Ubrania"], ["Góry", "Deszcz", "Camping"], tags)
seed_item("Kurtka puchowa", categories["Ubrania"], ["Zima", "Góry"], tags)
seed_item("Koszula", categories["Ubrania"], ["Biznes", "Elegancko", "Miasto"], tags)
seed_item("Spodnie eleganckie", categories["Ubrania"], ["Biznes", "Elegancko"], tags)
seed_item("Strój kąpielowy", categories["Ubrania"], ["Plaża", "Lato"], tags)
seed_item("Piżama", categories["Ubrania"], ["Długi wyjazd", "Weekend"], tags)
seed_item("Sukienka", categories["Ubrania"], ["Lato", "Plaża", "Miasto"], tags)
seed_item("Legginsy", categories["Ubrania"], ["Góry", "Camping", "Miasto", "Weekend"], tags)
seed_item("Bielizna termoaktywna", categories["Ubrania"], ["Zima", "Góry", "Camping"], tags)

# Kosmetyki
seed_item("Szczoteczka do zębów", categories["Kosmetyki"], ["Plaża", "Miasto", "Góry", "Zima", "Lato", "Camping", "Biznes", "Weekend", "Długi wyjazd"], tags)
seed_item("Pasta do zębów", categories["Kosmetyki"], ["Plaża", "Miasto", "Góry", "Zima", "Lato", "Camping", "Biznes", "Weekend", "Długi wyjazd"], tags)
seed_item("Szampon", categories["Kosmetyki"], ["Miasto", "Biznes", "Długi wyjazd", "Weekend"], tags)
seed_item("Krem z filtrem", categories["Kosmetyki"], ["Plaża", "Lato", "Góry", "Camping"], tags)
seed_item("Dezodorant", categories["Kosmetyki"], ["Plaża", "Miasto", "Góry", "Lato", "Camping", "Biznes", "Weekend", "Długi wyjazd"], tags)
seed_item("Pomadka do ust", categories["Kosmetyki"], ["Zima", "Góry", "Camping"], tags)
seed_item("Spray na komary", categories["Kosmetyki"], ["Góry", "Camping"], tags)
seed_item("Leki", categories["Kosmetyki"], ["Plaża", "Miasto", "Góry", "Zima", "Lato", "Camping", "Biznes", "Weekend", "Długi wyjazd"], tags)

# Elektronika
seed_item("Ładowarka do telefonu", categories["Elektronika"], ["Plaża", "Miasto", "Góry", "Zima", "Lato", "Camping", "Biznes", "Weekend", "Długi wyjazd"], tags)
seed_item("Laptop", categories["Elektronika"], ["Biznes", "Miasto", "Długi wyjazd"], tags)
seed_item("Ładowarka do laptopa", categories["Elektronika"], ["Biznes", "Miasto", "Długi wyjazd"], tags)
seed_item("Powerbank", categories["Elektronika"], ["Góry", "Camping", "Miasto", "Długi wyjazd", "Plaża"], tags)
seed_item("Słuchawki", categories["Elektronika"], ["Miasto", "Biznes", "Długi wyjazd"], tags)
seed_item("Aparat fotograficzny", categories["Elektronika"], ["Plaża", "Góry", "Miasto", "Camping"], tags)
seed_item("Czytnik e-booków", categories["Elektronika"], ["Plaża", "Długi wyjazd", "Weekend"], tags)

# Dokumenty
seed_item("Paszport", categories["Dokumenty"], ["Miasto", "Plaża", "Biznes", "Długi wyjazd"], tags)
seed_item("Ubezpieczenie podróżne", categories["Dokumenty"], ["Miasto", "Plaża", "Góry", "Biznes", "Długi wyjazd"], tags)
seed_item("Karta pokładowa", categories["Dokumenty"], ["Miasto", "Plaża", "Biznes", "Długi wyjazd"], tags)

# Akcesoria
seed_item("Okulary przeciwsłoneczne", categories["Akcesoria"], ["Plaża", "Lato", "Miasto", "Góry"], tags)
seed_item("Czapka", categories["Akcesoria"], ["Plaża", "Lato", "Góry"], tags)
seed_item("Zegarek", categories["Akcesoria"], ["Biznes", "Elegancko", "Miasto"], tags)
seed_item("Pasek", categories["Akcesoria"], ["Biznes", "Elegancko", "Miasto"], tags)
seed_item("Szalik", categories["Akcesoria"], ["Zima", "Miasto"], tags)
seed_item("Rękawiczki", categories["Akcesoria"], ["Zima", "Góry"], tags)
seed_item("Parasol", categories["Akcesoria"], ["Deszcz", "Miasto", "Biznes"], tags)
seed_item("Plecak dzienny", categories["Akcesoria"], ["Góry", "Miasto", "Plaża"], tags)

# Obuwie
seed_item("Adidasy", categories["Obuwie"], ["Miasto", "Weekend", "Lato"], tags)
seed_item("Buty trekkingowe", categories["Obuwie"], ["Góry", "Camping"], tags)
seed_item("Klapki", categories["Obuwie"], ["Plaża", "Lato"], tags)
seed_item("Buty eleganckie", categories["Obuwie"], ["Biznes", "Elegancko"], tags)
seed_item("Ciepłe buty", categories["Obuwie"], ["Zima"], tags)

# Jedzenie
seed_item("Przekąski", categories["Jedzenie"], ["Góry", "Camping", "Długi wyjazd"], tags)
seed_item("Butelka na wodę", categories["Jedzenie"], ["Góry", "Camping", "Miasto", "Plaża", "Lato"], tags)

# Sprzęt
seed_item("Namiot", categories["Sprzęt"], ["Camping"], tags)
seed_item("Śpiwór", categories["Sprzęt"], ["Camping"], tags)
seed_item("Czołówka", categories["Sprzęt"], ["Camping", "Góry"], tags)
seed_item("Apteczka", categories["Sprzęt"], ["Camping", "Góry"], tags)
seed_item("Kijki trekkingowe", categories["Sprzęt"], ["Góry"], tags)
seed_item("Ręcznik podróżny", categories["Sprzęt"], ["Plaża", "Camping", "Góry"], tags)

puts "Seeded #{Category.count} categories, #{Tag.count} tags, #{Item.count} items, #{ItemTag.count} item-tag associations"
