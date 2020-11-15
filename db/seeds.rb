# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Destroy all Clothes'
Clothe.destroy_all
puts 'Destroy all Brands'
Brand.destroy_all
puts '... building array'

array = ['10IS', 'Absorba', 'Alice', 'Arsène et les pipelettes', 'Baby b gosh', 'Benetton', 'Billieblush', 'Blune', 'Bonpoint', 'Bonton', 'Boutchou', 'Burberry', 'C&A', 'Carrément Beau', 'Catimini', 'CdeC', 'Chipie', 'Cyrillus', 'Dior', 'DPAM', 'Gap', 'Gocco', 'H&M', 'IKKS', 'Isabel Marant', 'Jacadi', 'Kiabi', 'Kickers', 'K-way', 'La Redoute', 'Le Bome', 'Levis', 'Lola Palacios', 'Louis Louise', 'Mango', 'Monoprix', 'Natalys', 'Noukies', 'Obaidi', 'Okaïdi', 'Orchestra', 'Oscar & Valentine', 'Oshkosh', 'Paul Smith', 'Petit Bateau', 'Ralph Lauren', 'Ronron', 'Sergent Major', 'Stella McCartney', 'Sucre d Orge','TAO', 'Tape à l œil', 'Tartine & Chocolat', 'The Little White Company', 'Timberland', 'Vert Baudet', 'Zadig & Voltaire', 'Zara']
array2 = ['Bloomer', 'Bloomer Salopette', 'Blouse', 'Body', 'Chaussures', 'Chaussons', 'Chemise', 'Combinaison', 'Doudoune', 'Ensemble', 'Gilet', 'Hauts Manches Longues', 'Jupe', 'Manteau', 'Pantalon', 'Pull', 'Pyjama', 'Robe', 'Salopette', 'Veste']

puts "CREATING PRICES HASH"
puts '----------------'
puts "CREATING BRANDS"
puts '----------------'
array.each do |element|
  x = Brand.new(name: element)
  x.save
end
puts '>>>>>> Done!'
puts '----------------'

puts "CREATING CLOTHES"
puts '----------------'
array2.each do |element|
  y = Clothe.new(name: element)
  y.save
end
puts '>>>>>> Done!'
puts '----------------'

Product.destroy_all
puts 'Create Products'
# LES PRIX INDIQUES SONT EN TTC. PENSEZ A CHANGER CETTE BASE DE DONNEE ET TRAVAILLER EN HT
@product1 = Product.new(brand: 'Jacadi', name: 'Manteau', price: 40.00/1.2)
@product2 = Product.new(brand: 'Boutchou', name: 'Manteau', price: 16.00/1.2)
@product3 = Product.new(brand: 'Jacadi', name: 'Combinaison', price: 19.00/1.2)
@product4 = Product.new(brand: 'Petit Bateau', name: 'Manteau', price: 30.00/1.2)
@product5 = Product.new(brand: 'Vert Baudet', name: 'Manteau', price: 19.00/1.2)
@product6 = Product.new(brand: 'Gap', name: 'Manteau', price: 20.00/1.2)
@product7 = Product.new(brand: 'Petit Bateau', name: 'Cap', price: 30.00/1.2)
@product8 = Product.new(brand: 'Petit Bateau', name: 'Veste', price: 19.00/1.2)
@product9 = Product.new(brand: 'Vert Baudet', name: 'Manteau', price: 18.00/1.2)
@product10 = Product.new(brand: 'Boutchou', name: 'Manteau', price: 16.00/1.2)
@product11 = Product.new(brand: 'Obaidi', name: 'Manteau', price: 13.00/1.2)
@product12 = Product.new(brand: 'Petit Bateau', name: 'Pyjama', price: 12.00/1.2)
@product13 = Product.new(brand: 'Petit Bateau', name: 'Robe', price: 18.00/1.2)
@product14 = Product.new(brand: 'Ralph Lauren', name: 'Pull', price: 23.00/1.2)
@product15 = Product.new(brand: 'Alice', name: 'Veste', price: 19.00/1.2)
@product16 = Product.new(brand: 'Monoprix', name: 'Haut manches longues', price: 6.00/1.2)
@product17 = Product.new(brand: 'Alice', name: 'Robe', price: 30.00/1.2)
@product18 = Product.new(brand: 'Monoprix', name: 'Pantalon', price: 8.00/1.2)
@product19 = Product.new(brand: 'Boutchou', name: 'Haut manches longues', price: 7.00/1.2)
@product20 = Product.new(brand: 'Boutchou', name: 'Pull', price: 13.00/1.2)
@product21 = Product.new(brand: 'Monoprix', name: 'Gilet', price: 13.00/1.2)
@product22 = Product.new(brand: 'Monoprix', name: 'Gilet', price: 13.00/1.2)
@product23 = Product.new(brand: 'Monoprix', name: 'Robe', price: 13.00/1.2)
@product24 = Product.new(brand: 'Monoprix', name: 'Gilet', price: 13.00/1.2)
@product25 = Product.new(brand: 'Bensimon', name: 'Veste', price: 35.00/1.2)
@product26 = Product.new(brand: 'Kickers', name: 'Chaussures', price: 35.00/1.2)
@product27 = Product.new(brand: 'Kickers', name: 'Chaussures', price: 35.00/1.2)
@product28 = Product.new(brand: 'Jacadi', name: 'Chaussures', price: 35.00/1.2)
@product29 = Product.new(brand: 'Kickers', name: 'Chaussures', price: 19.00/1.2)
@product30 = Product.new(brand: '10IS', name: 'Chaussures', price: 35.00/1.2)
@product31 = Product.new(brand: 'Okaïdi', name: 'Chaussons', price: 4.00/1.2)
@product32 = Product.new(brand: 'Kickers', name: 'Chaussures', price: 35.00/1.2)
@product33 = Product.new(brand: 'Kickers', name: 'Chaussures', price: 19.00/1.2)
@product34 = Product.new(brand: 'Jacadi', name: 'Chaussures', price: 25.00/1.2)
@product35 = Product.new(brand: 'Zara', name: 'Chaussures', price: 10.00/1.2)
@product36 = Product.new(brand: 'Kickers', name: 'Chaussures', price: 35.00/1.2)
@product37 = Product.new(brand: 'Kickers', name: 'Chaussures', price: 20.00/1.2)
@product38 = Product.new(brand: 'Monoprix', name: 'Pull', price: 9.00/1.2)
@product39 = Product.new(brand: 'Gap', name: 'Pantalon', price: 10.00/1.2)
@product40 = Product.new(brand: 'Monoprix', name: 'Pull', price: 9.00/1.2)
@product41 = Product.new(brand: 'Cyrillus', name: 'Pull', price: 13.00/1.2)
@product42 = Product.new(brand: 'Okaïdi', name: 'Haut manches longues', price: 5.00/1.2)
@product43 = Product.new(brand: 'Alice', name: 'Jupe', price: 14.00/1.2)
@product44 = Product.new(brand: 'Alice', name: 'Jupe', price: 14.00/1.2)
@product45 = Product.new(brand: 'Monoprix', name: 'Haut manches longues', price: 7.00/1.2)
@product46 = Product.new(brand: 'Boutchou', name: 'Robe', price: 13.00/1.2)
@product47 = Product.new(brand: 'Monoprix', name: 'Pantalon', price: 8.00/1.2)
@product48 = Product.new(brand: 'Cyrillus', name: 'Pantalon', price: 12.00/1.2)
@product49 = Product.new(brand: 'Oshkosh', name: 'Salopette', price: 19.00/1.2)
@product51 = Product.new(brand: 'Gap', name: 'Pantalon', price: 10.00/1.2)
@product52 = Product.new(brand: 'Boutchou', name: 'Robe', price: 13.00/1.2)
@product53 = Product.new(brand: 'Jacadi', name: 'Pull', price: 15.00/1.2)
@product54 = Product.new(brand: 'Monoprix', name: 'Pull', price: 9.00/1.2)
@product55 = Product.new(brand: 'Monoprix', name: 'Pull', price: 9.00/1.2)
@product56 = Product.new(brand: 'Jacadi', name: 'Pull', price: 15.00/1.2)
@product57 = Product.new(brand: 'Zara', name: 'Combinaison', price: 8.00/1.2)
@product58 = Product.new(brand: 'Cyrillus', name: 'Gilet', price: 13.00/1.2)
@product59 = Product.new(brand: 'Kiabi', name: 'Manteau', price: 8.00/1.2)
@product60 = Product.new(brand: 'C&A', name: 'Manteau', price: 13.00/1.2)
@product61 = Product.new(brand: 'Ralph Lauren', name: 'Gilet', price: 24.00/1.2)
@product62 = Product.new(brand: 'Ralph Lauren', name: 'Chemise', price: 21.00/1.2)
@product63 = Product.new(brand: 'Jacadi', name: 'Veste', price: 21.00/1.2)
@product64 = Product.new(brand: 'Boutchou', name: 'Haut manches longues', price: 7.00/1.2)
@product65 = Product.new(brand: 'Jacadi', name: 'Pyjama', price: 11.00/1.2)
@product66 = Product.new(brand: 'Jacadi', name: 'Blouse', price: 17.00/1.2)
@product67 = Product.new(brand: 'Boutchou', name: 'Salopette', price: 14.00/1.2)
@product68 = Product.new(brand: 'Bonpoint', name: 'Blouse', price: 22.00/1.2)
@product69 = Product.new(brand: 'Gap', name: 'Blouse', price: 8.00/1.2)
@product70 = Product.new(brand: 'Gap', name: 'Haut manches longues', price: 8.00/1.2)
@product71 = Product.new(brand: 'Cyrillus', name: 'Manteau', price: 29.00/1.2)
@product72 = Product.new(brand: 'Zara', name: 'Manteau', price: 13.00/1.2)
@product73 = Product.new(brand: 'Cyrillus', name: 'Manteau', price: 13.00/1.2)
@product74 = Product.new(brand: 'H&M', name: 'Manteau', price: 10.00/1.2)
@product75 = Product.new(brand: 'Orchestra', name: 'Manteau', price: 12.00/1.2)
@product76 = Product.new(brand: 'DPAM', name: 'Manteau', price: 12.00/1.2)
@product77 = Product.new(brand: 'Gap', name: 'Manteau', price: 15.00/1.2)
@product78 = Product.new(brand: 'Dior', name: 'Manteau', price: 50.00/1.2)
@product79 = Product.new(brand: 'DPAM', name: 'Manteau', price: 15.00/1.2)
@product80 = Product.new(brand: 'Petit Bateau', name: 'Manteau', price: 35.00/1.2)
@product81 = Product.new(brand: 'Kiabi', name: 'Manteau', price: 15.00/1.2)
@product82 = Product.new(brand: 'Obaibi', name: 'Manteau', price: 13.00/1.2)
@product83 = Product.new(brand: 'Sergent Major', name: 'Manteau', price: 12.00/1.2)
@product84 = Product.new(brand: 'Sergent Major', name: 'Manteau', price: 10.00/1.2)
@product85 = Product.new(brand: 'Sergent Major', name: 'Manteau', price: 14.00/1.2)
@product86 = Product.new(brand: 'Kiabi', name: 'Manteau', price: 12.00/1.2)
@product87 = Product.new(brand: 'Boutchou', name: 'Pyjama', price: 8.00/1.2)
@product88 = Product.new(brand: 'Boutchou', name: 'Pyjama', price: 8.00/1.2)
@product89 = Product.new(brand: 'Boutchou', name: 'Pyjama', price: 8.00/1.2)
@product90 = Product.new(brand: 'Kiabi', name: 'Gilet', price: 8.00/1.2)
@product91 = Product.new(brand: 'Gocco', name: 'Gilet', price: 8.00/1.2)
@product92 = Product.new(brand: 'Petit Bateau', name: 'Gilet', price: 10.00/1.2)
@product93 = Product.new(brand: 'Petit Bateau', name: 'Pantalon', price: 11.00/1.2)
@product94 = Product.new(brand: 'Boutchou', name: 'Pyjama', price: 8.00/1.2)
@product95 = Product.new(brand: 'Cyrillus', name: 'Pantalon', price: 11.00/1.2)
@product96 = Product.new(brand: 'Gocco', name: 'Bloomer salopette', price: 12.00/1.2)
@product97 = Product.new(brand: 'Boutchou', name: 'Body', price: 6.00/1.2)
@product98 = Product.new(brand: 'Boutchou', name: 'Body', price: 6.00/1.2)
@product99 = Product.new(brand: 'Boutchou', name: 'Body', price: 6.00/1.2)
@product100 = Product.new(brand: 'Boutchou', name: 'Body', price: 3.50/1.2)
@product101 = Product.new(brand: 'Patachou', name: 'Gilet', price: 8.00/1.2)
@product102 = Product.new(brand: 'Zara', name: 'Gilet', price: 8.00/1.2)
@product103 = Product.new(brand: 'Gocco', name: 'Chemise', price: 10.00/1.2)
@product104 = Product.new(brand: 'Gocco', name: 'Salopette', price: 13.00/1.2)
@product105 = Product.new(brand: 'Cyrillus', name: 'Blouse', price: 12.00/1.2)
@product106 = Product.new(brand: 'Zara', name: 'Blouse', price: 5.00/1.2)
@product107 = Product.new(brand: 'Obaibi', name: 'Ensemble', price: 9.00/1.2)
@product108 = Product.new(brand: 'Sergent Major', name: 'Gilet', price: 7.00/1.2)
@product109 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 13.00/1.2)
@product110 = Product.new(brand: 'La Redoute', name: 'Gilet', price: 7.00/1.2)
@product111 = Product.new(brand: 'Noukies', name: 'Pyjama', price: 9.00/1.2)
@product112 = Product.new(brand: 'Jacadi', name: 'Body', price: 3.50/1.2)
@product113 = Product.new(brand: 'Gap', name: 'Pull', price: 8.00/1.2)
@product114 = Product.new(brand: 'Jacadi', name: 'Pyjama', price: 11.00/1.2)
@product115 = Product.new(brand: 'Petit Bateau', name: 'Ensemble', price: 18.00/1.2)
@product116 = Product.new(brand: 'Cyrillus', name: 'Pyjama', price: 11.00/1.2)
@product117 = Product.new(brand: 'Petit Bateau', name: 'Pyjama', price: 10.00/1.2)
@product118 = Product.new(brand: 'Vertbaudet', name: 'Ensemble', price: 6.00/1.2)
@product119 = Product.new(brand: 'Zara', name: 'Haut manches longues', price: 5.00/1.2)
@product120 = Product.new(brand: 'TAO', name: 'Combinaison', price: 7.00/1.2)
@product120 = Product.new(brand: 'Petit Bateau', name: 'Body', price: 12.00/1.2)
@product121 = Product.new(brand: 'Boutchou', name: 'Pyjama', price: 8.00/1.2)
@product122 = Product.new(brand: 'Boutchou', name: 'Pyjama', price: 8.00/1.2)
@product123 = Product.new(brand: 'La Redoute', name: 'Pyjama', price: 7.00/1.2)
@product124 = Product.new(brand: 'Petit Bateau', name: 'Pyjama', price: 10.00/1.2)
@product125 = Product.new(brand: 'Petit Bateau', name: 'Robe', price: 13.00/1.2)
@product126 = Product.new(brand: 'Boutchou', name: 'Blouse', price: 13.00/1.2)
@product127 = Product.new(brand: 'Obaibi', name: 'Gilet', price: 6.00/1.2)
@product128 = Product.new(brand: 'Billieblush', name: 'Pyjama', price: 16.00/1.2)
@product129 = Product.new(brand: 'Zara', name: 'Pantalon', price: 8.00/1.2)
@product130 = Product.new(brand: 'C&A', name: 'Pantalon', price: 6.00/1.2)
@product131 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product132 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product133 = Product.new(brand: 'Arsène et les pipelettes', name: 'Pantalon', price: 12.00/1.2)
@product134 = Product.new(brand: 'La Redoute', name: 'Pantalon', price: 6.00/1.2)
@product135 = Product.new(brand: 'Zara', name: 'Pantalon', price: 8.00/1.2)
@product136 = Product.new(brand: 'The Little White Company', name: 'Pantalon', price: 8.50/1.2)
@product137 = Product.new(brand: 'Petit Bateau', name: 'Pantalon', price: 8.00/1.2)
@product139 = Product.new(brand: 'Zara', name: 'Pantalon', price: 5.00/1.2)
@product140 = Product.new(brand: 'Obaibi', name: 'Pantalon', price: 6.00/1.2)
@product141 = Product.new(brand: 'Catimini', name: 'Combinaison', price: 15.00/1.2)
@product142 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 8.50/1.2)
@product143 = Product.new(brand: 'Cyrillus', name: 'Chemise', price: 12.00/1.2)
@product144 = Product.new(brand: 'Petit Bateau', name: 'Salopette', price: 13.00/1.2)
@product145 = Product.new(brand: 'Boutchou', name: 'Blouse', price: 10.00/1.2)
@product146 = Product.new(brand: 'Jacadi', name: 'Veste', price: 22.00/1.2)
@product147 = Product.new(brand: 'Boutchou', name: 'Robe', price: 13.00/1.2)
@product148 = Product.new(brand: 'DPAM', name: 'Salopette', price: 7.00/1.2)
@product149 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 12.00/1.2)
@product150 = Product.new(brand: 'Boutchou', name: 'Pull', price: 11.00/1.2)
@product151 = Product.new(brand: 'Jacadi', name: 'Gilet', price: 9.00/1.2)
@product152 = Product.new(brand: 'Ralph Lauren', name: 'Haut manches longues', price: 10.00/1.2)
@product153 = Product.new(brand: 'Jacadi', name: 'Haut manches longues', price: 13.00/1.2)
@product154 = Product.new(brand: 'Boutchou', name: 'Chemise', price: 10.00/1.2)
@product155 = Product.new(brand: 'Cyrillus', name: 'Chemise', price: 9.00/1.2)
@product156 = Product.new(brand: 'Jacadi', name: 'Chemise', price: 11.00/1.2)
@product157 = Product.new(brand: 'Kiabi', name: 'Pull', price: 6.00/1.2)
@product158 = Product.new(brand: 'Catimini', name: 'Robe', price: 15.00/1.2)
@product159 = Product.new(brand: 'Carrément Beau', name: 'Combinaison', price: 15.00/1.2)
@product160 = Product.new(brand: 'Catimini', name: 'Robe', price: 14.00/1.2)
@product161 = Product.new(brand: 'Patachou', name: 'Cardigan', price: 13.00/1.2)
@product162 = Product.new(brand: 'Boutchou', name: 'Blouse', price: 8.00/1.2)
@product163 = Product.new(brand: 'DPAM', name: 'Pyjama', price: 6.00/1.2)
@product164 = Product.new(brand: 'Boutchou', name: 'Haut manches longues', price: 8.00/1.2)
@product165 = Product.new(brand: 'Boutchou', name: 'Body', price: 3.00/1.2)
@product166 = Product.new(brand: 'TAO', name: 'Pyjama', price: 6.00/1.2)
@product167 = Product.new(brand: 'Catimini', name: 'Cardigan', price: 20.00/1.2)
@product168 = Product.new(brand: 'Jacadi', name: 'Blouse', price: 12.00/1.2)
@product169 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 11.00/1.2)
@product170 = Product.new(brand: 'Boutchou', name: 'Blouse', price: 8.00/1.2)
@product171 = Product.new(brand: 'Noukies', name: 'Haut manches longues', price: 10.00/1.2)
@product172 = Product.new(brand: 'Noukies', name: 'Haut manches longues', price: 10.00/1.2)
@product173 = Product.new(brand: 'Boutchou', name: 'Combinaison', price: 8.00/1.2)
@product174 = Product.new(brand: 'Boutchou', name: 'Pyjama', price: 8.00/1.2)
@product175 = Product.new(brand: 'Boutchou', name: 'Chemise', price: 10.00/1.2)
@product176 = Product.new(brand: 'Zara', name: 'Pull', price: 8.00/1.2)
@product177 = Product.new(brand: 'Zara', name: 'Haut manches longues', price: 5.00/1.2)
@product178 = Product.new(brand: 'Boutchou', name: 'Haut manches longues', price: 7.00/1.2)
@product179 = Product.new(brand: 'Marc Jacobs', name: 'T-shirt', price: 21.00/1.2)
@product180 = Product.new(brand: 'Petit Bateau', name: 'Veste', price: 20.00/1.2)
@product181 = Product.new(brand: 'Petit Bateau', name: 'Body', price: 3.50/1.2)
@product182 = Product.new(brand: 'Noukies', name: 'Haut manches longues', price: 10.00/1.2)
@product183 = Product.new(brand: 'Sergent Major', name: 'Robe', price: 8.00/1.2)
@product184 = Product.new(brand: 'Uniclo', name: 'Pyjama', price: 5.00/1.2)
@product185 = Product.new(brand: 'H&M', name: 'Blouson', price: 10.00/1.2)
@product186 = Product.new(brand: 'Petit Bateau', name: 'Pyjama', price: 10.00/1.2)
@product187 = Product.new(brand: 'Boutchou', name: 'Cardigan', price: 8.00/1.2)
@product188 = Product.new(brand: 'Petit Bateau', name: 'Body', price: 3.00/1.2)
@product189 = Product.new(brand: 'Jacadi', name: 'Gilet', price: 13.00/1.2)
@product190 = Product.new(brand: 'Petit Bateau', name: 'Robe', price: 12.00/1.2)
@product191 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 6.50/1.2)
@product192 = Product.new(brand: 'Jacadi', name: 'Bloomer salopette', price: 14.50/1.2)
@product193 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 11.00/1.2)
@product194 = Product.new(brand: 'Jacadi', name: 'Combinaison', price: 14.50/1.2)
@product195 = Product.new(brand: 'Boutchou', name: 'Blouse', price: 8.00/1.2)
@product196 = Product.new(brand: 'Boutchou', name: 'Robe', price: 11.00/1.2)
@product197 = Product.new(brand: 'Petit Bateau', name: 'Gilet', price: 12.00/1.2)
@product198 = Product.new(brand: 'Kiabi', name: 'Haut manches longues', price: 4.00/1.2)
@product199 = Product.new(brand: 'The Little White Company', name: 'Pyjama', price: 10.00/1.2)
@product200 = Product.new(brand: 'Petit Bateau', name: 'Ensemble', price: 9.00/1.2)
@product201 = Product.new(brand: 'Jacadi', name: 'Combinaison', price: 14.00/1.2)
@product202 = Product.new(brand: 'Petit Bateau', name: 'Combinaison', price: 15.00/1.2)
@product203 = Product.new(brand: 'Obaibi', name: 'Gigoteuse', price: 11.00/1.2)
@product204 = Product.new(brand: 'Boutchou', name: 'Gigoteuse', price: 13.00/1.2)
@product205 = Product.new(brand: 'Ralph Lauren', name: 'Pantalon', price: 15.00/1.2)
@product206 = Product.new(brand: 'Ralph Lauren', name: 'Chemise', price: 15.00/1.2)
@product207 = Product.new(brand: 'Petit Bateau', name: 'Salopette', price: 16.00/1.2)
@product208 = Product.new(brand: 'Frangin Frangine', name: 'Bloomer', price: 14.50/1.2)
@product209 = Product.new(brand: 'Boutchou', name: 'Salopette', price: 10.00/1.2)
@product210 = Product.new(brand: 'A-lebaby', name: 'Combinaison', price: 15.00/1.2)
@product211 = Product.new(brand: 'Patachou', name: 'Blouse', price: 14.00/1.2)
@product212 = Product.new(brand: 'Bonton', name: 'Bonnet', price: 9.00/1.2)
@product213 = Product.new(brand: 'Petit Bateau', name: 'Body', price: 6.00/1.2)
@product214 = Product.new(brand: 'Petit Bateau', name: 'Body', price: 5.00/1.2)
@product215 = Product.new(brand: 'Zef', name: 'Body', price: 13.00/1.2)
@product216 = Product.new(brand: 'Cyrillus', name: 'Body', price: 10.00/1.2)
@product217 = Product.new(brand: 'Sergent Major', name: 'Bonnet', price: 3.00/1.2)
@product218 = Product.new(brand: 'IKKS', name: 'Bonnet', price: 6.00/1.2)
@product219 = Product.new(brand: 'The Little White Company', name: 'Bonnet', price: 7.00/1.2)
@product220 = Product.new(brand: 'Jacadi', name: 'Bonnet', price: 7.00/1.2)
@product221 = Product.new(brand: 'Jacadi', name: 'Bonnet', price: 7.00/1.2)
@product222 = Product.new(brand: 'Cyrillus', name: 'Pantalon', price: 11.50/1.2)
@product223 = Product.new(brand: 'Cyrillus', name: 'Legging', price: 8.00/1.2)
@product224 = Product.new(brand: 'Boutchou', name: 'Legging', price: 8.00/1.2)
@product225 = Product.new(brand: 'Jacadi', name: 'Pantalon', price: 14.00/1.2)
@product226 = Product.new(brand: 'Zara', name: 'Gilet', price: 7.00/1.2)
@product227 = Product.new(brand: 'Petit Bateau', name: 'Robe', price: 17.00/1.2)
@product228 = Product.new(brand: 'Jacadi', name: 'Body', price: 8.00/1.2)
@product229 = Product.new(brand: 'Jacadi', name: 'Gilet', price: 13.50/1.2)
@product230 = Product.new(brand: 'Petit Bateau', name: 'Gilet', price: 11.00/1.2)
@product231 = Product.new(brand: 'Nike', name: 'Pull', price: 16.00/1.2)
@product232 = Product.new(brand: 'Gap', name: 'Blouse', price: 5.00/1.2)
@product233 = Product.new(brand: 'Jacadi', name: 'Blouse', price: 13.50/1.2)
@product234 = Product.new(brand: 'Tartine et Chocolat', name: 'Chemise', price: 18.80/1.2)
@product235 = Product.new(brand: 'Petit Bateau', name: 'Pyjama', price: 10.00/1.2)
@product236 = Product.new(brand: 'Cyrillus', name: 'Haut manches longues', price: 9.00/1.2)
@product237 = Product.new(brand: 'Natalys', name: 'Pantalon', price: 14.00/1.2)
@product238 = Product.new(brand: 'Newbie', name: 'Chemise', price: 7.00/1.2)
@product239 = Product.new(brand: 'Grain de Blé', name: 'Gilet', price: 7.00/1.2)
@product240 = Product.new(brand: 'Bobo Choses', name: 'Sweat', price: 18.00/1.2)
@product241 = Product.new(brand: 'Boutchou', name: 'Cardigan', price: 12.00/1.2)
@product242 = Product.new(brand: 'DPAM', name: 'Kway', price: 7.00/1.2)
@product243 = Product.new(brand: 'Jacadi', name: 'Gilet', price: 13.50/1.2)
@product244 = Product.new(brand: 'Gap', name: 'Pyjama', price: 8.00/1.2)
@product245 = Product.new(brand: 'Petit Bateau', name: 'Gilet', price: 10.00/1.2)
@product246 = Product.new(brand: 'Jacadi', name: 'Robe', price: 14.00/1.2)
@product247 = Product.new(brand: 'Natalys', name: 'Combinaison', price: 15.00/1.2)
@product248 = Product.new(brand: 'Mayoral', name: 'Veste', price: 15.00/1.2)
@product249 = Product.new(brand: 'Oshkosh', name: 'Salopette', price: 7.00/1.2)
@product250 = Product.new(brand: 'Boutchou', name: 'Pyjama', price: 8.00/1.2)
@product251 = Product.new(brand: 'Petit Bateau', name: 'Body', price: 5.00/1.2)
@product252 = Product.new(brand: 'Boutchou', name: 'Blouse', price: 10.00/1.2)
@product253 = Product.new(brand: 'Natalys', name: 'Pull', price: 16.00/1.2)
@product254 = Product.new(brand: 'Sergent Major', name: 'Salopette', price: 8.00/1.2)
@product255 = Product.new(brand: 'Petit Bateau', name: 'Salopette', price: 15.00/1.2)
@product256 = Product.new(brand: 'Jacadi', name: 'Haut manches longues', price: 11.00/1.2)
@product257 = Product.new(brand: 'Tartine et Chocolat', name: 'Salopette', price: 23.00/1.2)
@product258 = Product.new(brand: 'H&M', name: 'Pull', price: 7.00/1.2)
@product259 = Product.new(brand: 'Boutchou', name: 'Blouse', price: 10.00/1.2)
@product260 = Product.new(brand: 'TAO', name: 'Robe', price: 7.00/1.2)
@product261 = Product.new(brand: 'Boutchou', name: 'Haut manches longues', price: 7.00/1.2)
@product262 = Product.new(brand: 'Jacadi', name: 'Blouse', price: 17.00/1.2)
@product263 = Product.new(brand: 'Jacadi', name: 'Blouse', price: 17.00/1.2)
@product264 = Product.new(brand: 'Jacadi', name: 'Blouse', price: 17.00/1.2)
@product265 = Product.new(brand: 'Boutchou', name: 'Salopette', price: 13.00/1.2)
@product266 = Product.new(brand: 'Boutchou', name: 'Haut manches longues', price: 8.00/1.2)
@product267 = Product.new(brand: 'Carrément Beau', name: 'Gilet', price: 12.00/1.2)
@product268 = Product.new(brand: 'Boutchou', name: 'Robe', price: 12.00/1.2)
@product269 = Product.new(brand: 'Numaé', name: 'Pull', price: 29.00/1.2)
@product270 = Product.new(brand: 'Gap', name: 'Gilet', price: 7.00/1.2)
@product271 = Product.new(brand: 'Gap', name: 'Haut manches longues', price: 7.00/1.2)
@product272 = Product.new(brand: 'Gap', name: 'Chemise', price: 9.00/1.2)
@product273 = Product.new(brand: 'Boutchou', name: 'Haut manches longues', price: 7.00/1.2)
@product274 = Product.new(brand: 'Catimini', name: 'Ensemble', price: 17.00/1.2)
@product275 = Product.new(brand: 'Catimini', name: 'Robe', price: 15.00/1.2)
@product276 = Product.new(brand: 'DPAM', name: 'Robe', price: 6.00/1.2)
@product277 = Product.new(brand: 'Petit Bateau', name: 'Pyjama', price: 8.00/1.2)
@product278 = Product.new(brand: 'Petit Bateau', name: 'Pyjama', price: 10.00/1.2)
@product279 = Product.new(brand: 'Boutchou', name: 'Chemise', price: 10.00/1.2)
@product280 = Product.new(brand: 'Boutchou', name: 'Polo', price: 10.00/1.2)
@product281 = Product.new(brand: 'Zara', name: 'Sweat', price: 7.00/1.2)
@product282 = Product.new(brand: 'Zara', name: 'Pyjama', price: 7.00/1.2)
@product283 = Product.new(brand: 'Jacadi', name: 'Body', price: 9.00/1.2)
@product284 = Product.new(brand: 'Sergent Major', name: 'Cardigan', price: 10.00/1.2)
@product285 = Product.new(brand: 'Jean Bourget', name: 'Robe', price: 12.00/1.2)
@product286 = Product.new(brand: 'IKKS', name: 'Chemise', price: 17.00/1.2)
@product287 = Product.new(brand: 'Bobine', name: 'Blouse', price: 9.00/1.2)
@product288 = Product.new(brand: 'Boutchou', name: 'Polo', price: 10.00/1.2)
@product289 = Product.new(brand: 'Petit Bateau', name: 'Robe', price: 17.00/1.2)
@product290 = Product.new(brand: 'Petit Bateau', name: 'Haut manches longues', price: 9.00/1.2)
@product291 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 10.00/1.2)
@product292 = Product.new(brand: 'Zara', name: 'Chemise', price: 8.00/1.2)
@product293 = Product.new(brand: 'Petit Bateau', name: 'Robe', price: 8.00/1.2)
@product294 = Product.new(brand: 'Billybandit', name: 'Haut manches longues', price: 7.50/1.2)
@product295 = Product.new(brand: 'Absorba', name: 'Robe', price: 16.00/1.2)
@product296 = Product.new(brand: 'Boutchou', name: 'Robe', price: 13.00/1.2)
@product297 = Product.new(brand: 'Boutchou', name: 'Blouse', price: 10.00/1.2)
@product298 = Product.new(brand: 'Cyrillus', name: 'Gilet', price: 13.00/1.2)
@product299 = Product.new(brand: 'Numaé', name: 'Pyjama', price: 12.00/1.2)
@product300 = Product.new(brand: 'Burberry', name: 'Polo', price: 30.00/1.2)
@product301 = Product.new(brand: 'Boutchou', name: 'Pyjama', price: 9.00/1.2)
@product302 = Product.new(brand: 'DPAM', name: 'Robe', price: 8.00/1.2)
@product303 = Product.new(brand: 'Gap', name: 'Haut manches longues', price: 8.00/1.2)
@product304 = Product.new(brand: 'Gap', name: 'Pull', price: 9.00/1.2)
@product305 = Product.new(brand: 'Boutchou', name: 'Haut manches longues', price: 7.00/1.2)
@product306 = Product.new(brand: 'Gap', name: 'Chemise', price: 8.00/1.2)
@product307 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 13.50/1.2)
@product308 = Product.new(brand: 'Eden et Victor', name: 'Pull', price: 10.00/1.2)
@product309 = Product.new(brand: 'Jacadi', name: 'Haut manches longues', price: 10.00/1.2)
@product310 = Product.new(brand: 'Bonpoint', name: 'Robe', price: 22.00/1.2)
@product311 = Product.new(brand: 'Catimini', name: 'Pull', price: 20.00/1.2)
@product312 = Product.new(brand: 'Catimini', name: 'Pull', price: 20.00/1.2)
@product313 = Product.new(brand: 'Boutchou', name: 'Chemise', price: 10.00/1.2)
@product314 = Product.new(brand: 'Boutchou', name: 'Chemise', price: 10.00/1.2)
@product315 = Product.new(brand: 'French Disorder', name: 'Sweat', price: 15.50/1.2)
@product316 = Product.new(brand: 'Petit Bateau', name: 'Veste', price: 14.00/1.2)
@product317 = Product.new(brand: 'Boutchou', name: 'Pull', price: 13.00/1.2)
@product318 = Product.new(brand: 'Petit Bateau', name: 'Legging', price: 8.00/1.2)
@product319 = Product.new(brand: 'Jacadi', name: 'Short', price: 10.00/1.2)
@product320 = Product.new(brand: 'Cyrillus', name: 'Veste', price: 21.00/1.2)
@product321 = Product.new(brand: 'Boutchou', name: 'Chemise', price: 7.00/1.2)
@product322 = Product.new(brand: 'Ralph Lauren', name: 'Polo', price: 20.00/1.2)
@product323 = Product.new(brand: 'Petit Bateau', name: 'Robe', price: 14.00/1.2)
@product324 = Product.new(brand: 'Boutchou', name: 'Chemise', price: 11.00/1.2)
@product325 = Product.new(brand: 'Boutchou', name: 'Polo', price: 10.00/1.2)
@product326 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 12.00/1.2)
@product327 = Product.new(brand: 'CdeC', name: 'Haut manches longues', price: 13.00/1.2)
@product328 = Product.new(brand: 'Marlot', name: 'Robe', price: 30.00/1.2)
@product329 = Product.new(brand: 'Jacadi', name: 'Gilet', price: 10.50/1.2)
@product330 = Product.new(brand: 'CdeC', name: 'Haut manches longues', price: 13.00/1.2)
@product331 = Product.new(brand: 'Bonpoint', name: 'Robe', price: 39.00/1.2)
@product332 = Product.new(brand: 'Alice ', name: 'Blouse', price: 13.00/1.2)
@product333 = Product.new(brand: 'Boutchou', name: 'Blouse', price: 10.00/1.2)
@product334 = Product.new(brand: 'Sergent Major', name: 'Combinaison', price: 7.50/1.2)
@product335 = Product.new(brand: 'CdeC', name: 'Pull', price: 17.00/1.2)
@product336 = Product.new(brand: 'Jacadi', name: 'Pull', price: 13.00/1.2)
@product337 = Product.new(brand: 'Sergent Major', name: 'Robe', price: 9.00/1.2)
@product338 = Product.new(brand: 'Bonpoint', name: 'Gilet', price: 25.00/1.2)
@product339 = Product.new(brand: 'Bonton', name: 'Robe', price: 24.00/1.2)
@product340 = Product.new(brand: 'Burberry', name: 'Robe', price: 60.00/1.2)
@product341 = Product.new(brand: 'Boutchou', name: 'Chemise', price: 10.00/1.2)
@product342 = Product.new(brand: 'Monoprix', name: 'Polo', price: 10.00/1.2)
@product343 = Product.new(brand: 'Jacadi', name: 'Polo', price: 10.00/1.2)
@product344 = Product.new(brand: 'Ralph Lauren', name: 'Chemise', price: 21.00/1.2)
@product345 = Product.new(brand: 'Monoprix', name: 'Haut manches longues', price: 6.00/1.2)
@product346 = Product.new(brand: 'Gap', name: 'Chemise', price: 11.00/1.2)
@product347 = Product.new(brand: 'Monoprix', name: 'Gilet', price: 10.00/1.2)
@product348 = Product.new(brand: 'Jacadi', name: 'Haut manches longues', price: 12.00/1.2)
@product349 = Product.new(brand: 'Monoprix', name: 'Haut manches longues', price: 7.00/1.2)
@product350 = Product.new(brand: 'Bonpoint', name: 'Robe', price: 45.00/1.2)
@product351 = Product.new(brand: 'Lemonberet', name: 'Jupe', price: 10.00/1.2)
@product352 = Product.new(brand: 'Ralph Lauren', name: 'Polo', price: 20.00/1.2)
@product353 = Product.new(brand: 'Jacadi', name: 'Chemise', price: 19.00/1.2)
@product354 = Product.new(brand: 'Jacadi', name: 'Chemise', price: 19.00/1.2)
@product355 = Product.new(brand: 'Jacadi', name: 'Chemise', price: 19.00/1.2)
@product356 = Product.new(brand: 'Ralph Lauren', name: 'veste', price: 35.00/1.2)
@product357 = Product.new(brand: 'Ralph Lauren', name: 'Polo', price: 25.00/1.2)
@product358 = Product.new(brand: 'Ralph Lauren', name: 'Polo', price: 25.00/1.2)
@product359 = Product.new(brand: 'Jacadi', name: 'Polo', price: 20.00/1.2)
@product360 = Product.new(brand: 'Petit Bateau', name: 'Gilet', price: 24.00/1.2)
@product361 = Product.new(brand: 'Monoprix', name: 'Pull', price: 14.00/1.2)
@product362 = Product.new(brand: 'CdeC', name: 'Haut manches longues', price: 13.00/1.2)
@product363 = Product.new(brand: 'Zara', name: 'Robe', price: 12.00/1.2)
@product364 = Product.new(brand: 'Baby b gosh', name: 'Manteau', price: 19.00/1.2)
@product365 = Product.new(brand: 'Cyrillus', name: 'Pyjama', price: 14.00/1.2)
@product366 = Product.new(brand: 'Zara', name: 'Pantalon', price: 6.00/1.2)
@product367 = Product.new(brand: 'Zara', name: 'Pantalon', price: 6.00/1.2)
@product368 = Product.new(brand: 'Lola Palacio', name: 'Ensemble', price: 19.00/1.2)
@product369 = Product.new(brand: 'Interbaby', name: 'Gigoteuse', price: 10.00/1.2)
@product370 = Product.new(brand: 'Sucre d Orge', name: 'Gigoteuse', price: 10.00/1.2)
@product371 = Product.new(brand: 'Interbaby', name: 'Gigoteuse', price: 10.00/1.2)
@product372 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product373 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product374 = Product.new(brand: 'Natalys', name: 'Legging', price: 7.00/1.2)
@product375 = Product.new(brand: 'Cyrillus', name: 'Pantalon', price: 11.50/1.2)
@product376 = Product.new(brand: 'La Redoute', name: 'Pantalon', price: 7.00/1.2)
@product377 = Product.new(brand: 'Vertbaudet', name: 'Pantalon', price: 4.50/1.2)
@product378 = Product.new(brand: 'Jacadi', name: 'Pantalon', price: 15.50/1.2)
@product379 = Product.new(brand: 'Cyrillus', name: 'Pantalon', price: 13.00/1.2)
@product380 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product381 = Product.new(brand: 'Jacadi', name: 'Pantalon', price: 10.00/1.2)
@product382 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product383 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product384 = Product.new(brand: 'Château de Sable', name: 'Pantalon', price: 10.00/1.2)
@product385 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product386 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product387 = Product.new(brand: 'Name it', name: 'Pantalon', price: 7.00/1.2)
@product388 = Product.new(brand: 'Sergent Major', name: 'Pantalon', price: 8.00/1.2)
@product389 = Product.new(brand: 'Jacadi', name: 'Pantalon', price: 18.00/1.2)
@product390 = Product.new(brand: 'The Little White Company', name: 'Pantalon', price: 8.50/1.2)
@product391 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product392 = Product.new(brand: 'Litlle Cigogne', name: 'Pantalon', price: 7.00/1.2)
@product393 = Product.new(brand: 'Cyrillus', name: 'Short', price: 10.00/1.2)
@product394 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product395 = Product.new(brand: 'Jacadi', name: 'Pantalon', price: 12.00/1.2)
@product396 = Product.new(brand: 'Gap', name: 'Pantalon', price: 7.00/1.2)
@product397 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product398 = Product.new(brand: 'Petit Bateau', name: 'Pantalon', price: 11.00/1.2)
@product399 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product400 = Product.new(brand: 'Petit Bateau', name: 'Pyjama', price: 10.00/1.2)
@product401 = Product.new(brand: 'Jacadi', name: 'Salopette', price: 16.50/1.2)
@product402 = Product.new(brand: 'Petit Bateau', name: 'Gilet', price: 13.00/1.2)
@product403 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product404 = Product.new(brand: 'Boutchou', name: 'Gilet', price: 10.00/1.2)
@product405 = Product.new(brand: 'Boutchou', name: 'Pull', price: 9.00/1.2)
@product406 = Product.new(brand: 'Boutchou', name: 'Pantalon', price: 8.00/1.2)
@product407 = Product.new(brand: 'Petit Bateau', name: 'Haut manches longues', price: 12.00/1.2)
@product408 = Product.new(brand: 'Petit Bateau', name: 'Combinaison', price: 13.50/1.2)
@product409 = Product.new(brand: 'Froddo', name: 'Chaussons', price: 12.00/1.2)
@product410 = Product.new(brand: 'Cyrillus', name: 'Pantalon', price: 11.00/1.2)
@product411 = Product.new(brand: 'Jacadi', name: 'Pantalon', price: 12.00/1.2)
@product412 = Product.new(brand: 'Kiabi', name: 'Pantalon', price: 3.50/1.2)
@product413 = Product.new(brand: 'Boutchou', name: 'Legging', price: 7.00/1.2)
@product414 = Product.new(brand: 'C&A', name: 'Legging', price: 3.00/1.2)
@product415 = Product.new(brand: 'Petit Bateau', name: 'Robe', price: 10.00/1.2)
@product416 = Product.new(brand: 'Petit Bateau', name: 'Salopette', price: 15.00/1.2)
@product417 = Product.new(brand: 'Boutchou', name: 'Combinaison', price: 20.00/1.2)
@product418 = Product.new(brand: 'Ralph Lauren', name: 'Pull', price: 23.00/1.2)
@product419 = Product.new(brand: 'Boutchou', name: 'Pull', price: 12.00/1.2)
puts '> Time to save products'
@product1.save!
@product2.save!
@product3.save!
@product4.save!
@product5.save!
@product6.save!
@product7.save!
@product8.save!
@product9.save!
@product10.save!
@product11.save!
@product12.save!
@product13.save!
@product14.save!
@product15.save!
@product16.save!
@product17.save!
@product18.save!
@product19.save!
@product20.save!
@product21.save!
@product22.save!
@product23.save!
@product24.save!
@product25.save!
@product26.save!
@product27.save!
@product28.save!
@product29.save!
@product30.save!
@product31.save!
@product32.save!
@product33.save!
@product34.save!
@product35.save!
@product36.save!
@product37.save!
@product38.save!
@product39.save!
@product40.save!
@product41.save!
@product42.save!
@product43.save!
@product44.save!
@product45.save!
@product46.save!
@product47.save!
@product48.save!
@product49.save!
@product51.save!
@product52.save!
@product53.save!
@product54.save!
@product55.save!
@product56.save!
@product57.save!
@product58.save!
@product59.save!
@product60.save!
@product61.save!
@product62.save!
@product63.save!
@product64.save!
@product65.save!
@product66.save!
@product67.save!
@product68.save!
@product69.save!
@product70.save!
@product71.save!
@product72.save!
@product73.save!
@product74.save!
@product75.save!
@product76.save!
@product77.save!
@product78.save!
@product79.save!
@product80.save!
@product81.save!
@product82.save!
@product83.save!
@product84.save!
@product85.save!
@product86.save!
@product87.save!
@product88.save!
@product89.save!
@product90.save!
@product91.save!
@product92.save!
@product93.save!
@product94.save!
@product95.save!
@product96.save!
@product97.save!
@product98.save!
@product99.save!
@product100.save!
@product101.save!
@product102.save!
@product103.save!
@product104.save!
@product105.save!
@product106.save!
@product107.save!
@product108.save!
@product109.save!
@product110.save!
@product111.save!
@product112.save!
@product113.save!
@product114.save!
@product115.save!
@product116.save!
@product117.save!
@product118.save!
@product119.save!
@product120.save!
@product120.save!
@product121.save!
@product122.save!
@product123.save!
@product124.save!
@product125.save!
@product126.save!
@product127.save!
@product128.save!
@product129.save!
@product130.save!
@product131.save!
@product132.save!
@product133.save!
@product134.save!
@product135.save!
@product136.save!
@product137.save!
@product139.save!
@product140.save!
@product141.save!
@product142.save!
@product143.save!
@product144.save!
@product145.save!
@product146.save!
@product147.save!
@product148.save!
@product149.save!
@product150.save!
@product151.save!
@product152.save!
@product153.save!
@product154.save!
@product155.save!
@product156.save!
@product157.save!
@product158.save!
@product159.save!
@product160.save!
@product161.save!
@product162.save!
@product163.save!
@product164.save!
@product165.save!
@product166.save!
@product167.save!
@product168.save!
@product169.save!
@product170.save!
@product171.save!
@product172.save!
@product173.save!
@product174.save!
@product175.save!
@product176.save!
@product177.save!
@product178.save!
@product179.save!
@product180.save!
@product181.save!
@product182.save!
@product183.save!
@product184.save!
@product185.save!
@product186.save!
@product187.save!
@product188.save!
@product189.save!
@product190.save!
@product191.save!
@product192.save!
@product193.save!
@product194.save!
@product195.save!
@product196.save!
@product197.save!
@product198.save!
@product199.save!
@product200.save!
@product201.save!
@product202.save!
@product203.save!
@product204.save!
@product205.save!
@product206.save!
@product207.save!
@product208.save!
@product209.save!
@product210.save!
@product211.save!
@product212.save!
@product213.save!
@product214.save!
@product215.save!
@product216.save!
@product217.save!
@product218.save!
@product219.save!
@product220.save!
@product221.save!
@product222.save!
@product223.save!
@product224.save!
@product225.save!
@product226.save!
@product227.save!
@product228.save!
@product229.save!
@product230.save!
@product231.save!
@product232.save!
@product233.save!
@product234.save!
@product235.save!
@product236.save!
@product237.save!
@product238.save!
@product239.save!
@product240.save!
@product241.save!
@product242.save!
@product243.save!
@product244.save!
@product245.save!
@product246.save!
@product247.save!
@product248.save!
@product249.save!
@product250.save!
@product251.save!
@product252.save!
@product253.save!
@product254.save!
@product255.save!
@product256.save!
@product257.save!
@product258.save!
@product259.save!
@product260.save!
@product261.save!
@product262.save!
@product263.save!
@product264.save!
@product265.save!
@product266.save!
@product267.save!
@product268.save!
@product269.save!
@product270.save!
@product271.save!
@product272.save!
@product273.save!
@product274.save!
@product275.save!
@product276.save!
@product277.save!
@product278.save!
@product279.save!
@product280.save!
@product281.save!
@product282.save!
@product283.save!
@product284.save!
@product285.save!
@product286.save!
@product287.save!
@product288.save!
@product289.save!
@product290.save!
@product291.save!
@product292.save!
@product293.save!
@product294.save!
@product295.save!
@product296.save!
@product297.save!
@product298.save!
@product299.save!
@product300.save!
@product301.save!
@product302.save!
@product303.save!
@product304.save!
@product305.save!
@product306.save!
@product307.save!
@product308.save!
@product309.save!
@product310.save!
@product311.save!
@product312.save!
@product313.save!
@product314.save!
@product315.save!
@product316.save!
@product317.save!
@product318.save!
@product319.save!
@product320.save!
@product321.save!
@product322.save!
@product323.save!
@product324.save!
@product325.save!
@product326.save!
@product327.save!
@product328.save!
@product329.save!
@product330.save!
@product331.save!
@product332.save!
@product333.save!
@product334.save!
@product335.save!
@product336.save!
@product337.save!
@product338.save!
@product339.save!
@product340.save!
@product341.save!
@product342.save!
@product343.save!
@product344.save!
@product345.save!
@product346.save!
@product347.save!
@product348.save!
@product349.save!
@product350.save!
@product351.save!
@product352.save!
@product353.save!
@product354.save!
@product355.save!
@product356.save!
@product357.save!
@product358.save!
@product359.save!
@product360.save!
@product361.save!
@product362.save!
@product363.save!
@product364.save!
@product365.save!
@product366.save!
@product367.save!
@product368.save!
@product369.save!
@product370.save!
@product371.save!
@product372.save!
@product373.save!
@product374.save!
@product375.save!
@product376.save!
@product377.save!
@product378.save!
@product379.save!
@product380.save!
@product381.save!
@product382.save!
@product383.save!
@product384.save!
@product385.save!
@product386.save!
@product387.save!
@product388.save!
@product389.save!
@product390.save!
@product391.save!
@product392.save!
@product393.save!
@product394.save!
@product395.save!
@product396.save!
@product397.save!
@product398.save!
@product399.save!
@product400.save!
@product401.save!
@product402.save!
@product403.save!
@product404.save!
@product405.save!
@product406.save!
@product407.save!
@product408.save!
@product409.save!
@product410.save!
@product411.save!
@product412.save!
@product413.save!
@product414.save!
@product415.save!
@product416.save!
@product417.save!
@product418.save!
@product419.save!
puts '>>>>>> Done!'
