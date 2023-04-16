SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT AVG(age), MIN(age), MAX(age) FROM singer WHERE country = 'France'
SELECT AVG(age), MIN(age), MAX(age) FROM singer WHERE country = 'French'
SELECT singer.Name, singer.Song_release_year FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID JOIN concert ON concert.concert_ID = singer_in_concert.concert_ID WHERE singer.Age = (SELECT MIN(Age) FROM singer) ORDER BY singer.Song_release_year ASC LIMIT 1
SELECT singer.Name, singer.Song_release_year FROM singer WHERE singer.Age = (SELECT MIN(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT singer.Country FROM singer WHERE singer.Age > 20
SELECT singer.Country, COUNT(singer.Singer_ID) AS num_singers FROM singer GROUP BY singer.Country ORDER BY num_singers DESC
SELECT country, COUNT(*) FROM singer GROUP BY country
SELECT singer.song_name FROM singer WHERE singer.age > (SELECT AVG(age) FROM singer)
SELECT singer.song_name FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID JOIN concert ON concert.concert_ID = singer_in_concert.concert_ID WHERE singer.age > (SELECT AVG(age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT MAX(capacity), AVG(capacity) FROM stadium
SELECT AVG(capacity), MAX(capacity) FROM stadium
SELECT name, capacity FROM stadium WHERE average = (SELECT MAX(average) FROM stadium)
SELECT name, capacity FROM stadium WHERE average = (SELECT MAX(average) FROM stadium)
SELECT COUNT(*) FROM concert WHERE year = '2014' OR year = '2015'
SELECT COUNT(*) FROM concert WHERE year = '2014' OR year = '2015'
SELECT stadium.Name, COUNT(concert.concert_ID) AS num_concerts FROM stadium LEFT JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID GROUP BY stadium.Name ORDER BY num_concerts DESC
SELECT stadium.Stadium_ID, stadium.Name, COUNT(concert.concert_ID) AS num_concerts FROM stadium LEFT JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID GROUP BY stadium.Stadium_ID
SELECT stadium.Name, stadium.Capacity, COUNT(concert.concert_ID) AS num_concerts FROM concert JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID WHERE concert.Year >= '2014' GROUP BY stadium.Stadium_ID ORDER BY num_concerts DESC LIMIT 1;
SELECT stadium.Name, stadium.Capacity FROM stadium JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID WHERE concert.Year > 2013 GROUP BY stadium.Stadium_ID ORDER BY COUNT(concert.concert_ID) DESC LIMIT 1
SELECT year, COUNT(*) as num_concerts FROM concert GROUP BY year ORDER BY num_concerts DESC LIMIT 1;
SELECT year, COUNT(*) as num_concerts FROM concert GROUP BY year ORDER BY num_concerts DESC LIMIT 1;
SELECT name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT DISTINCT s1.country, s2.country FROM singer s1, singer s2, singer_in_concert sic1, singer_in_concert sic2, concert c1, concert c2 WHERE s1.age > 40 AND s2.age < 30 AND s1.Singer_ID = sic1.Singer_ID AND s2.Singer_ID = sic2.Singer_ID AND sic1.concert_ID = c1.concert_ID AND sic2.concert_ID = c2.concert_ID AND c1.stadium_ID = c2.stadium_ID
SELECT name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE year = '2014')
SELECT concert_Name, Theme, COUNT(Singer_ID) AS num_singers FROM concert LEFT JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY concert.concert_ID
SELECT concert_Name, Theme, COUNT(Singer_ID) AS num_singers FROM concert JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY concert.concert_ID
SELECT singer.Name, COUNT(singer_in_concert.concert_ID) AS num_concerts FROM singer LEFT JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID GROUP BY singer.Name ORDER BY num_concerts DESC
SELECT singer.Name, COUNT(singer_in_concert.concert_ID) AS num_concerts FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID GROUP BY singer.Name ORDER BY num_concerts DESC
SELECT singer.Name FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID JOIN concert ON concert.concert_ID = singer_in_concert.concert_ID WHERE concert.Year = '2014'
SELECT singer.Name FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID JOIN concert ON concert.concert_ID = singer_in_concert.concert_ID WHERE concert.Year = '2014'
SELECT singer.Name, singer.Country FROM singer WHERE singer.Song_Name LIKE '%Hey%'
SELECT singer.Name, singer.Country FROM singer WHERE singer.Song_Name LIKE '%Hey%'
SELECT DISTINCT stadium.Name, stadium.Location FROM concert JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID WHERE concert.Year = '2014' AND stadium.Stadium_ID IN ( SELECT concert.Stadium_ID FROM concert WHERE concert.Year = '2015' )
SELECT DISTINCT stadium.Name, stadium.Location FROM stadium INNER JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID WHERE concert.Year = '2014' AND stadium.Stadium_ID IN (SELECT concert.Stadium_ID FROM concert WHERE concert.Year = '2015') ORDER BY stadium.Name
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT COUNT(*) FROM Pets WHERE weight > 10
ERROR
ERROR
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) AS max_weight FROM Pets GROUP BY PetType
SELECT COUNT(*) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Age > 20
SELECT COUNT(DISTINCT PetID) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20
SELECT COUNT(*) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'
SELECT COUNT(*) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT DISTINCT Student.Fname FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType IN ('cat', 'dog') ORDER BY Student.Fname ASC
SELECT DISTINCT Student.Fname FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType IN ('cat', 'dog')
SELECT DISTINCT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' AND s.StuID IN (SELECT hp.StuID FROM Has_Pet hp JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog') ORDER BY s.Fname LIMIT 1
SELECT DISTINCT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' AND s.StuID IN ( SELECT s.StuID FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog' ) ORDER BY s.Fname
SELECT Student.Major, Student.Age FROM Student LEFT JOIN Has_Pet ON Student.StuID = Has_Pet.StuID LEFT JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType != 'cat' OR Pets.PetType IS NULL
SELECT s.Major, s.Age FROM Student s WHERE s.StuID NOT IN (SELECT hp.StuID FROM Has_Pet hp JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat') ORDER BY s.Major
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat')
SELECT DISTINCT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat')
SELECT Student.Fname, Student.Age FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'dog' AND Student.StuID NOT IN (SELECT Student.StuID FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat') ORDER BY Student.Age ASC LIMIT 1
SELECT Student.Fname FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'dog' AND Student.StuID NOT IN (SELECT Student.StuID FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat') ORDER BY Student.StuID ASC
ERROR
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT Pets.PetID, Pets.weight FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID WHERE Pets.pet_age > 1
SELECT Pets.PetID, Pets.weight FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID WHERE Pets.pet_age > 1
SELECT PetType, AVG(pet_age) AS avg_age, MAX(pet_age) AS max_age FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY PetType
SELECT PetType, AVG(pet_age) AS avg_age, MAX(pet_age) AS max_age FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY PetType
SELECT Student.Fname, Student.Age FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID ORDER BY Student.Age ASC LIMIT 10
SELECT DISTINCT Student.Fname, Student.Age FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID ORDER BY Student.Age
SELECT PetID FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.LName = 'Smith'
ERROR
SELECT Has_Pet.StuID, COUNT(Has_Pet.PetID) AS num_pets FROM Has_Pet GROUP BY Has_Pet.StuID
SELECT StuID, COUNT(PetID) AS num_pets FROM Has_Pet GROUP BY StuID
SELECT Student.Fname, Student.Sex FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Has_Pet.StuID HAVING COUNT(Has_Pet.PetID) > 1 ORDER BY Student.Fname ASC LIMIT 1
SELECT Student.Fname, Student.Sex FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID HAVING COUNT(Has_Pet.PetID) > 1
SELECT s.LName FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' AND p.pet_age = 3 ORDER BY s.LName ASC LIMIT 1
SELECT s.LName FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' AND p.pet_age = 3 ORDER BY s.LName DESC LIMIT 1;
SELECT AVG(age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT COUNT(*) FROM continents
SELECT COUNT(*) FROM continents
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) AS num_countries FROM continents JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId ORDER BY num_countries DESC
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) AS num_countries FROM continents JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId ORDER BY num_countries DESC
SELECT COUNT(*) FROM countries
SELECT COUNT(*) FROM countries
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.ModelId) AS NumModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id ORDER BY NumModels DESC
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.Model) AS NumModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id
SELECT model_list.Model, MIN(cars_data.Horsepower) FROM model_list JOIN car_names ON model_list.Model = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id GROUP BY model_list.Model ORDER BY MIN(cars_data.Horsepower) ASC LIMIT 1
SELECT car_names.Model FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId ORDER BY CAST(cars_data.Horsepower AS INTEGER) LIMIT 1;
SELECT model_list.Model FROM model_list JOIN car_names ON model_list.Model = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT model_list.Model FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE cars_data.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT DISTINCT car_makers.maker FROM car_makers JOIN car_names ON car_makers.id = car_names.makeid JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.year = 1970
SELECT DISTINCT car_makers.Maker FROM car_makers JOIN car_names ON car_makers.Id = car_names.MakeId JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year = 1970 ORDER BY car_makers.Maker ASC
SELECT car_makers.Maker, cars_data.Year FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Year = (SELECT MIN(Year) FROM cars_data) ORDER BY car_makers.Maker ASC
SELECT car_makers.Maker, MIN(cars_data.Year) FROM car_makers JOIN car_names ON car_makers.Id = car_names.MakeId JOIN cars_data ON car_names.MakeId = cars_data.Id GROUP BY car_makers.Maker ORDER BY MIN(cars_data.Year) ASC LIMIT 1
SELECT DISTINCT model_list.Model FROM model_list JOIN car_names ON model_list.Model = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year > 1980 ORDER BY model_list.Model ASC
SELECT DISTINCT model_list.Model FROM model_list JOIN car_names ON model_list.Model = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year > 1980 ORDER BY model_list.Model ASC
SELECT continents.Continent, COUNT(DISTINCT car_makers.Id) AS MakerCount FROM continents JOIN countries ON continents.ContId = countries.Continent JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY continents.Continent ORDER BY MakerCount DESC
SELECT continents.Continent, COUNT(DISTINCT car_makers.Id) AS NumCarMakers FROM continents JOIN countries ON continents.ContId = countries.Continent JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY continents.Continent ORDER BY NumCarMakers DESC
SELECT countries.CountryName, COUNT(car_makers.Id) AS num_car_makers FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryName ORDER BY num_car_makers DESC LIMIT 1
SELECT countries.CountryName, COUNT(car_makers.Id) AS num_makers FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryName ORDER BY num_makers DESC LIMIT 1;
SELECT car_makers.FullName, COUNT(model_list.ModelId) AS ModelCount FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id ORDER BY ModelCount DESC
ERROR
SELECT cars_data.Accelerate FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_names.Make = 'amc hornet sportabout (sw)'
SELECT cars_data.Accelerate FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_names.Model = 'hornet sportabout (sw)' AND car_makers.Maker = 'amc'
SELECT COUNT(*) FROM car_makers JOIN countries ON car_makers.Country = countries.CountryId JOIN continents ON countries.Continent = continents.ContId WHERE continents.Continent = 'Europe' AND countries.CountryName = 'France'
SELECT COUNT(DISTINCT car_makers.Id) FROM car_makers JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'France'
SELECT COUNT(DISTINCT model_list.ModelId) FROM car_names JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId JOIN continents ON countries.Continent = continents.ContId WHERE continents.Continent = 'usa'
SELECT COUNT(DISTINCT model_list.ModelId) FROM car_names JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'United States'
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT MIN(Weight) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE cylinders = 8 AND year = 1974
SELECT MIN(Weight) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE cylinders = 8 AND year = 1974
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker ORDER BY car_makers.Maker ASC
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker ORDER BY car_makers.Maker ASC
SELECT DISTINCT countries.CountryId, countries.CountryName, countries.Continent FROM countries INNER JOIN car_makers ON countries.CountryId = car_makers.Country ORDER BY countries.CountryName ASC
SELECT DISTINCT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country ORDER BY countries.CountryName ASC
SELECT COUNT(*) FROM cars_data WHERE CAST(horsepower AS INTEGER) > 150
SELECT COUNT(*) FROM cars_data WHERE CAST(horsepower AS INTEGER) > 150
SELECT cars_data.Year, AVG(cars_data.Weight) FROM cars_data GROUP BY cars_data.Year
SELECT cars_data.Year, AVG(cars_data.Weight) AS avg_weight, AVG(cars_data.Year) AS avg_year FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId JOIN continents ON countries.Continent = continents.ContId GROUP BY cars_data.Year
SELECT countries.CountryName, COUNT(DISTINCT car_makers.Id) AS num_manufacturers FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.Model = car_names.Model WHERE countries.Continent = 'Europe' GROUP BY countries.CountryName HAVING num_manufacturers >= 3 ORDER BY num_manufacturers DESC
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.Model = cn.Model GROUP BY c.CountryName HAVING COUNT(DISTINCT cm.Id) >= 3 AND c.Continent = 'Europe' ORDER BY c.CountryName ASC
SELECT MAX(cars_data.Horsepower), car_makers.Maker FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders = 3 GROUP BY car_makers.Maker
SELECT car_makers.Maker, MAX(cars_data.Horsepower) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders = 3 GROUP BY car_makers.Maker ORDER BY MAX(cars_data.Horsepower) DESC LIMIT 1
SELECT car_names.Model, cars_data.MPG FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id ORDER BY cars_data.MPG DESC LIMIT 1
SELECT car_names.Model, cars_data.MPG FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id ORDER BY cars_data.MPG DESC LIMIT 1;
SELECT AVG(cars_data.Horsepower) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Year < 1980
SELECT AVG(cars_data.Horsepower) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Year < 1980
SELECT AVG(cars_data.Edispl) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'volvo'
SELECT AVG(Edispl) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'Volvo'
SELECT cars_data.Cylinders, MAX(cars_data.Accelerate) FROM cars_data GROUP BY cars_data.Cylinders ORDER BY cars_data.Cylinders ASC
SELECT cylinders, MAX(accelerate) FROM cars_data GROUP BY cylinders
SELECT model_list.Model, COUNT(car_names.Make) AS num_cars FROM model_list JOIN car_names ON model_list.Model = car_names.Model GROUP BY model_list.Model ORDER BY num_cars DESC LIMIT 1;
SELECT Model, COUNT(DISTINCT MakeId) AS NumVersions FROM car_names GROUP BY Model ORDER BY NumVersions DESC LIMIT 1;
SELECT COUNT(*) FROM cars_data WHERE cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(DISTINCT model_list.ModelId) FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker WHERE car_makers.FullName = 'American Motor Company'
SELECT COUNT(*) FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'American Motor Company'
SELECT car_makers.Id, car_makers.FullName FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id HAVING COUNT(DISTINCT model_list.Model) > 3
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id HAVING COUNT(model_list.Model) > 3
SELECT DISTINCT model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.Model = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE (car_makers.FullName = 'General Motors' OR cars_data.Weight > 3500)
SELECT DISTINCT model_list.Model FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id JOIN car_names ON model_list.Model = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE car_makers.Maker = 'General Motors' OR cars_data.Weight > 3500 ORDER BY model_list.Model ASC
SELECT DISTINCT Year FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE Weight >= 3000 AND Weight <= 4000 ORDER BY Year
SELECT DISTINCT cd.Year FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId WHERE cd.Weight < 4000 AND cd.Year IN ( SELECT cd2.Year FROM cars_data cd2 JOIN car_names cn2 ON cd2.Id = cn2.MakeId WHERE cd2.Weight > 3000 ) ORDER BY cd.Year ASC
SELECT cars_data.Horsepower FROM cars_data ORDER BY cars_data.Accelerate DESC LIMIT 1
SELECT cars_data.Horsepower FROM cars_data ORDER BY cars_data.Accelerate DESC LIMIT 1
SELECT MIN(Cylinders) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'volvo' AND accelerate = (SELECT MIN(accelerate) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'volvo')
SELECT MIN(cars_data.Accelerate), cars_data.Cylinders FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'volvo' GROUP BY cars_data.Cylinders ORDER BY cars_data.Accelerate LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE accelerate > (SELECT MAX(accelerate) FROM cars_data WHERE horsepower = (SELECT MAX(horsepower) FROM cars_data))
SELECT COUNT(*) FROM cars_data WHERE accelerate > (SELECT MAX(accelerate) FROM cars_data WHERE horsepower = (SELECT MAX(horsepower) FROM cars_data))
SELECT COUNT(DISTINCT countries.CountryId) FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryId HAVING COUNT(DISTINCT car_makers.Id) > 2
SELECT COUNT(DISTINCT countries.CountryId) FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryId HAVING COUNT(DISTINCT car_makers.Id) > 2
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(*) FROM cars_data WHERE cylinders > 6
SELECT car_names.Model, MAX(cars_data.Horsepower) FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Cylinders = 4 GROUP BY car_names.Model ORDER BY MAX(cars_data.Horsepower) DESC LIMIT 1
SELECT car_names.Model, MAX(cars_data.Horsepower) FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Cylinders = 4 GROUP BY car_names.Model ORDER BY MAX(cars_data.Horsepower) DESC LIMIT 1
SELECT car_names.MakeId, car_makers.Maker FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders <= 3 AND cars_data.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) ORDER BY car_names.MakeId
SELECT car_names.MakeId, car_makers.Maker FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders < 4 AND cars_data.Horsepower > (SELECT MIN(Horsepower) FROM cars_data)
SELECT MAX(MPG) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE (cars_data.Cylinders = 8 OR cars_data.Year < 1980)
SELECT MAX(MPG) FROM cars_data WHERE (Cylinders = 8 OR Year < 1980)
SELECT model_list.Model FROM model_list JOIN car_names ON model_list.Model = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Weight < 3500 AND car_makers.Maker != 'Ford Motor Company' ORDER BY cars_data.Weight ASC
SELECT model_list.Model FROM model_list JOIN car_names ON model_list.Model = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Weight < 3500 AND car_makers.Maker != 'Ford Motor Company' ORDER BY cars_data.Weight ASC
SELECT c.ContId, c.Continent FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent LEFT JOIN car_makers cm ON co.CountryId = cm.Country WHERE cm.Id IS NULL GROUP BY c.ContId
SELECT countries.CountryName, continents.Continent FROM countries LEFT JOIN car_makers ON countries.CountryId = car_makers.Country JOIN continents ON countries.Continent = continents.ContId WHERE car_makers.Id IS NULL
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id HAVING COUNT(DISTINCT model_list.Model) >= 2 AND COUNT(DISTINCT car_makers.Id) > 3
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.Model = car_names.Model WHERE car_makers.Id IN (SELECT Maker FROM model_list GROUP BY Maker HAVING COUNT(DISTINCT model_list.Model) >= 2) AND car_names.MakeId IN (SELECT MakeId FROM car_names GROUP BY MakeId HAVING COUNT(DISTINCT car_names.Model) > 3) ORDER BY car_makers.Id ASC
ERROR
SELECT DISTINCT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.Model = car_names.Model WHERE car_makers.Maker = 'Fiat' OR countries.CountryId IN (SELECT car_makers.Country FROM car_makers GROUP BY car_makers.Country HAVING COUNT(DISTINCT car_makers.Id) > 3) ORDER BY countries.CountryName ASC
SELECT airlines.Country FROM airlines WHERE airlines.Airline = "JetBlue Airways"
SELECT airlines.Country FROM airlines WHERE airlines.Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = "JetBlue Airways"
ERROR
ERROR
ERROR
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM flights
SELECT COUNT(*) FROM flights
ERROR
ERROR
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
ERROR
SELECT AirportName FROM airports WHERE City='Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'ATO'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports AS source ON flights.SourceAirport = source.AirportCode JOIN airports AS dest ON flights.DestAirport = dest.AirportCode WHERE source.City = 'Aberdeen' AND dest.City = 'Ashley'
SELECT COUNT(*) FROM flights WHERE SourceAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') AND DestAirport = (SELECT AirportCode FROM airports WHERE City = 'Ashley')
ERROR
SELECT COUNT(*) FROM flights JOIN airlines ON flights.airline = airlines.uid WHERE airlines.airline = 'Jetblue Airways'
ERROR
ERROR
ERROR
ERROR
ERROR
ERROR
SELECT airports.City, COUNT(*) AS num_arrivals FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY airports.City ORDER BY num_arrivals DESC LIMIT 1;
SELECT airports.City, COUNT(*) AS DestCount FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode GROUP BY airports.City ORDER BY DestCount DESC LIMIT 1
SELECT airports.City, COUNT(*) AS num_flights FROM airports JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY airports.City ORDER BY num_flights DESC LIMIT 1;
SELECT airports.City, COUNT(*) AS num_flights FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode GROUP BY airports.City ORDER BY num_flights DESC LIMIT 1;
SELECT SourceAirport, COUNT(*) AS num_flights FROM flights GROUP BY SourceAirport ORDER BY num_flights DESC LIMIT 1;
SELECT SourceAirport, COUNT(*) AS num_flights FROM flights GROUP BY SourceAirport ORDER BY num_flights DESC LIMIT 1;
SELECT SourceAirport, COUNT(*) AS num_flights FROM flights GROUP BY SourceAirport ORDER BY num_flights ASC LIMIT 1;
SELECT SourceAirport, COUNT(*) AS num_flights FROM flights GROUP BY SourceAirport ORDER BY num_flights ASC LIMIT 1;
ERROR
SELECT airlines.Airline, COUNT(*) AS num_flights FROM flights JOIN airlines ON flights.Airline = airlines.uid GROUP BY airlines.Airline ORDER BY num_flights DESC LIMIT 1;
SELECT abbreviation, country FROM airlines WHERE uid = (SELECT airline FROM flights GROUP BY airline ORDER BY COUNT(*) ASC LIMIT 1)
SELECT abbreviation, country FROM airlines WHERE uid = ( SELECT airline FROM flights GROUP BY airline ORDER BY COUNT(*) ASC LIMIT 1 )
ERROR
ERROR
SELECT DISTINCT airlines.uid, airlines.Airline, airlines.Abbreviation, airlines.Country FROM airlines JOIN flights ON airlines.uid = flights.Airline JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportCode = 'AHD' ORDER BY airlines.Airline ASC
ERROR
ERROR
ERROR
ERROR
ERROR
ERROR
ERROR
ERROR
ERROR
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = "United Airlines"
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = "APG"
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportName = 'APG'
SELECT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = "Aberdeen"
SELECT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT flights.FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = "Aberdeen"
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen' OR airports.City = 'Abilene'
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen' OR City = 'Abilene')
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT AirportName, AirportCode FROM airports WHERE AirportCode NOT IN (SELECT DISTINCT SourceAirport FROM flights UNION SELECT DISTINCT DestAirport FROM flights) ORDER BY AirportName ASC
SELECT COUNT(Employee_ID) FROM employee
SELECT COUNT(Employee_ID) FROM employee
SELECT name, age FROM employee ORDER BY age ASC
SELECT name, age FROM employee ORDER BY age ASC
SELECT city, COUNT(employee.employee_id) AS num_employees FROM employee JOIN hiring ON employee.employee_id = hiring.employee_id GROUP BY city
SELECT city, COUNT(employee.employee_id) AS num_employees FROM employee JOIN hiring ON employee.employee_id = hiring.employee_id GROUP BY city
SELECT e.city FROM employee e JOIN hiring h ON e.employee_id = h.employee_id WHERE e.age < 30 GROUP BY e.city HAVING COUNT(DISTINCT e.employee_id) > 1
SELECT e.city FROM employee e WHERE e.age < 30 GROUP BY e.city HAVING COUNT(e.employee_id) > 1
SELECT location, COUNT(DISTINCT shop_id) AS num_shops FROM shop GROUP BY location ORDER BY num_shops DESC
SELECT location, COUNT(DISTINCT shop_id) FROM shop GROUP BY location ORDER BY COUNT(DISTINCT shop_id) DESC
SELECT s.manager_name, s.district FROM shop s WHERE s.number_products = (SELECT MAX(number_products) FROM shop)
SELECT s.manager_name, s.district FROM shop s WHERE s.number_products = (SELECT MAX(number_products) FROM shop)
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT employee.name, COUNT(evaluation.year_awarded) as awards FROM employee JOIN evaluation ON employee.employee_id = evaluation.employee_id GROUP BY employee.employee_id ORDER BY awards DESC LIMIT 1;
SELECT employee.name FROM evaluation JOIN employee ON evaluation.employee_id = employee.employee_id GROUP BY evaluation.employee_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT employee.name FROM evaluation JOIN employee ON evaluation.employee_id = employee.employee_id WHERE bonus = (SELECT MAX(bonus) FROM evaluation)
SELECT employee.name FROM evaluation JOIN employee ON evaluation.employee_id = employee.employee_id ORDER BY evaluation.bonus DESC LIMIT 1
SELECT employee.name FROM employee WHERE employee.employee_id NOT IN (SELECT evaluation.employee_id FROM evaluation) ORDER BY employee.name ASC
SELECT employee.name FROM employee LEFT JOIN evaluation ON employee.employee_id = evaluation.employee_id WHERE evaluation.employee_id IS NULL
SELECT shop.Name, COUNT(hiring.Employee_ID) AS num_employees FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Shop_ID ORDER BY num_employees DESC LIMIT 1;
SELECT shop.Name, COUNT(hiring.Employee_ID) AS num_employees FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Shop_ID ORDER BY num_employees DESC LIMIT 1;
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT shop.Name FROM shop LEFT JOIN hiring ON shop.Shop_ID = hiring.Shop_ID WHERE hiring.Employee_ID IS NULL
SELECT shop.Name, COUNT(hiring.Employee_ID) AS num_employees FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Name
SELECT shop.Name, COUNT(hiring.Employee_ID) AS num_employees FROM shop LEFT JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Shop_ID
SELECT SUM(Bonus) FROM evaluation
SELECT SUM(Bonus) FROM evaluation
SELECT hiring.shop_id, hiring.employee_id, hiring.start_from, hiring.is_full_time, employee.name, employee.age, employee.city, shop.name, shop.location, shop.district, shop.number_products, shop.manager_name, evaluation.year_awarded, evaluation.bonus FROM hiring JOIN employee ON hiring.employee_id = employee.employee_id JOIN shop ON hiring.shop_id = shop.shop_id LEFT JOIN evaluation ON hiring.employee_id = evaluation.employee_id
SELECT hiring.Shop_ID, hiring.Employee_ID, hiring.Start_from, hiring.Is_full_time, employee.Name, employee.Age, employee.City, shop.Name, shop.Location, shop.District, shop.Number_products, shop.Manager_name, evaluation.Year_awarded, evaluation.Bonus FROM hiring JOIN employee ON hiring.Employee_ID = employee.Employee_ID JOIN shop ON hiring.Shop_ID = shop.Shop_ID LEFT JOIN evaluation ON hiring.Employee_ID = evaluation.Employee_ID
SELECT DISTINCT s.district FROM shop s WHERE s.number_products < 3000 AND s.district IN ( SELECT s2.district FROM shop s2 WHERE s2.number_products > 10000 )
SELECT DISTINCT s.district FROM shop s JOIN hiring h ON s.shop_id = h.shop_id JOIN evaluation e ON h.employee_id = e.employee_id WHERE s.number_products < 3000 AND s.district IN ( SELECT s2.district FROM shop s2 WHERE s2.number_products > 10000 ) ORDER BY s.district ASC
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(*) FROM Documents
SELECT COUNT(*) FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Documents.Document_ID, Documents.Document_Name, Documents.Document_Description FROM Documents
SELECT documents.document_name, documents.template_id FROM documents WHERE documents.document_description LIKE '%w%'
SELECT documents.document_name, documents.template_id FROM documents WHERE documents.document_description LIKE '%w%'
SELECT d.Document_ID, d.Template_ID, d.Document_Description FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE d.Document_Name = "Robbin CV"
SELECT d.Document_ID, d.Template_ID, d.Document_Description FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE d.Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT templates.template_id) FROM templates JOIN documents ON templates.template_id = documents.template_id
SELECT COUNT(DISTINCT templates.template_type_code) FROM templates JOIN documents ON templates.template_id = documents.template_id
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT')
SELECT COUNT(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'PPT'
SELECT Templates.Template_ID, COUNT(Documents.Document_ID) AS num_documents FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID
SELECT Templates.Template_ID, COUNT(Documents.Document_ID) AS Usage_Count FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID
SELECT Templates.Template_ID, Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID ORDER BY COUNT(Documents.Document_ID) DESC LIMIT 1;
SELECT Templates.Template_ID, Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID ORDER BY COUNT(Documents.Document_ID) DESC LIMIT 1;
SELECT Templates.Template_ID FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID HAVING COUNT(DISTINCT Documents.Document_ID) > 1
SELECT DISTINCT Templates.Template_ID FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID HAVING COUNT(DISTINCT Documents.Document_ID) > 1
SELECT t.Template_ID FROM Templates t LEFT JOIN Documents d ON t.Template_ID = d.Template_ID WHERE d.Document_ID IS NULL
SELECT t.Template_ID FROM Templates t LEFT JOIN Documents d ON t.Template_ID = d.Template_ID WHERE d.Document_ID IS NULL
SELECT COUNT(Template_ID) FROM Templates
SELECT COUNT(Template_ID) FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT template_id, version_number, template_type_code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT'
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT version_number, template_type_code FROM Templates WHERE version_number > 5
SELECT version_number, template_type_code FROM Templates WHERE version_number > 5
SELECT Templates.Template_Type_Code, COUNT(Templates.Template_ID) AS Num_Templates FROM Templates GROUP BY Templates.Template_Type_Code
SELECT Templates.Template_Type_Code, COUNT(Templates.Template_ID) AS Num_Templates FROM Templates GROUP BY Templates.Template_Type_Code
SELECT template_type_code, COUNT(template_id) AS num_templates FROM templates GROUP BY template_type_code ORDER BY num_templates DESC LIMIT 1;
SELECT template_type_code, COUNT(*) AS num_templates FROM Templates GROUP BY template_type_code ORDER BY num_templates DESC LIMIT 1;
SELECT Template_Type_Code, COUNT(Template_ID) AS Template_Count FROM Templates GROUP BY Template_Type_Code HAVING Template_Count < 3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(DISTINCT Template_ID) < 3
SELECT MIN(Version_Number), Template_Type_Code FROM Templates
SELECT Templates.Template_Type_Code, MIN(Templates.Version_Number) AS Lowest_Version_Number FROM Templates GROUP BY Templates.Template_Type_Code
SELECT Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Document_Name = "Data base"
SELECT Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Document_Name = 'Data base'
SELECT Documents.Document_Name FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'BK'
SELECT d.Document_Name FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE t.Template_Type_Code = 'BK'
SELECT Templates.Template_Type_Code, COUNT(Documents.Document_ID) AS Num_Documents FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code
SELECT Ref_Template_Types.Template_Type_Code, Ref_Template_Types.Template_Type_Description, COUNT(Documents.Document_ID) AS Num_Documents FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Ref_Template_Types.Template_Type_Code ORDER BY Num_Documents DESC;
SELECT t.Template_Type_Code, COUNT(d.Document_ID) AS num_docs FROM Templates t JOIN Documents d ON t.Template_ID = d.Template_ID GROUP BY t.Template_Type_Code ORDER BY num_docs DESC LIMIT 1;
SELECT Templates.Template_Type_Code, COUNT(Documents.Document_ID) AS num_docs FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code ORDER BY num_docs DESC LIMIT 1;
SELECT DISTINCT t.Template_Type_Code FROM Templates t LEFT JOIN Documents d ON t.Template_ID = d.Template_ID WHERE d.Document_ID IS NULL
SELECT DISTINCT Ref_Template_Types.Template_Type_Code FROM Ref_Template_Types LEFT JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code WHERE Templates.Template_ID IS NULL
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = "AD"
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD';
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID
SELECT Templates.Template_ID FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = "Presentation"
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Presentation')
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Summer Show'
SELECT COUNT(*) FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Documents.Document_Name = 'Summer Show'
SELECT Paragraph_ID, Document_ID, Paragraph_Text FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_Text, Document_Name, Document_Description, Template_Type_Description, Version_Number, Date_Effective_From, Date_Effective_To, Template_Details FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Paragraph_Text LIKE '%Korea %'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Welcome to NY')
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Documents.Document_Name = "Customer reviews"
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Customer reviews'
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS Num_Paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID
SELECT documents.document_id, COUNT(paragraphs.paragraph_id) AS num_paragraphs FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id ORDER BY documents.document_id
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Num_Paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID
SELECT d.document_id, d.document_name, COUNT(p.paragraph_id) AS num_paragraphs FROM documents d LEFT JOIN paragraphs p ON d.document_id = p.document_id GROUP BY d.document_id ORDER BY num_paragraphs DESC
SELECT Document_ID, COUNT(*) as num_paragraphs FROM Paragraphs GROUP BY Document_ID HAVING num_paragraphs >= 2 ORDER BY Document_ID
SELECT p.Document_ID, COUNT(p.Paragraph_ID) AS num_paragraphs FROM Paragraphs p GROUP BY p.Document_ID HAVING num_paragraphs >= 2
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS num_paragraphs FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY num_paragraphs DESC LIMIT 1;
SELECT Documents.Document_ID, Documents.Document_Name FROM Documents JOIN ( SELECT Document_ID, COUNT(*) AS num_paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY num_paragraphs DESC LIMIT 1 ) AS max_paragraphs ON Documents.Document_ID = max_paragraphs.Document_ID
SELECT documents.document_id, COUNT(paragraphs.paragraph_id) AS num_paragraphs FROM documents LEFT JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id ORDER BY num_paragraphs ASC LIMIT 1;
SELECT documents.document_id, COUNT(paragraphs.paragraph_id) AS num_paragraphs FROM documents LEFT JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id ORDER BY num_paragraphs ASC LIMIT 1;
SELECT documents.Document_ID, COUNT(paragraphs.Paragraph_ID) AS num_paragraphs FROM documents JOIN paragraphs ON documents.Document_ID = paragraphs.Document_ID GROUP BY documents.Document_ID HAVING num_paragraphs BETWEEN 1 AND 2
SELECT d.Document_ID FROM Documents d JOIN ( SELECT Document_ID, COUNT(*) as num_paragraphs FROM Paragraphs GROUP BY Document_ID HAVING num_paragraphs BETWEEN 1 AND 2 ) p ON d.Document_ID = p.Document_ID
SELECT DISTINCT p.Document_ID FROM Paragraphs p WHERE p.Paragraph_Text IN ('Brazil', 'Ireland')
SELECT DISTINCT d.Document_ID FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE p.Paragraph_Text LIKE '%Brazil%' AND p.Paragraph_Text LIKE '%Ireland%'
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher
SELECT name FROM teacher ORDER BY age ASC
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age, Hometown FROM teacher
SELECT Name, Age, Hometown FROM teacher
SELECT name FROM teacher WHERE hometown != 'Little Lever Urban District'
SELECT name FROM teacher WHERE hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age IN ('32', '33')
SELECT Name FROM teacher WHERE Age IN ('32', '33')
SELECT Hometown FROM teacher ORDER BY Age LIMIT 1
SELECT teacher.hometown FROM teacher ORDER BY teacher.age ASC LIMIT 1
SELECT teacher.hometown, COUNT(teacher.teacher_id) AS num_teachers FROM teacher GROUP BY teacher.hometown
SELECT teacher.hometown, COUNT(teacher.teacher_id) FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id GROUP BY teacher.hometown
SELECT Hometown, COUNT(*) as count FROM teacher GROUP BY Hometown ORDER BY count DESC LIMIT 1
SELECT Hometown, COUNT(*) as Count FROM teacher GROUP BY Hometown ORDER BY Count DESC LIMIT 1
SELECT t1.Hometown FROM teacher t1 INNER JOIN teacher t2 ON t1.Hometown = t2.Hometown AND t1.Teacher_ID <> t2.Teacher_ID
SELECT hometown FROM teacher WHERE hometown IN ( SELECT hometown FROM teacher GROUP BY hometown HAVING COUNT(*) >= 2 ) ORDER BY hometown ASC
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name ASC
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name ASC
SELECT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course.Course_ID = course_arrange.Course_ID WHERE course.Course = 'math'
SELECT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID WHERE course.Course = 'math' ORDER BY teacher.Name ASC
SELECT teacher.Name, COUNT(course_arrange.Course_ID) AS num_courses FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Name ORDER BY num_courses DESC
SELECT teacher.Name, COUNT(course_arrange.Course_ID) AS num_courses FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Name
SELECT t.Name FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID HAVING COUNT(DISTINCT ca.Course_ID) >= 2 ORDER BY t.Name ASC
SELECT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID HAVING COUNT(DISTINCT course_arrange.Course_ID) >= 2 ORDER BY teacher.Name ASC
SELECT name FROM teacher WHERE teacher_id NOT IN (SELECT teacher_id FROM course_arrange)
SELECT DISTINCT teacher.name FROM teacher LEFT JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id WHERE course_arrange.course_id IS NULL ORDER BY teacher.name ASC
SELECT COUNT(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(age) FROM visitor WHERE Level_of_membership <= 4
SELECT visitor.Name, visitor.Level_of_membership FROM visitor WHERE visitor.Level_of_membership > 4 ORDER BY visitor.Age DESC
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1
SELECT AVG(num_of_staff) FROM museum WHERE open_year < '2009'
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT name FROM museum WHERE num_of_staff > (SELECT MIN(num_of_staff) FROM museum WHERE Open_Year > '2010')
SELECT visitor.ID, visitor.Name, visitor.Age FROM visitor INNER JOIN visit ON visitor.ID = visit.visitor_ID GROUP BY visitor.ID HAVING COUNT(DISTINCT visit.Museum_ID) > 1
SELECT visitor.ID, visitor.Name, visitor.Level_of_membership FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID GROUP BY visitor.ID ORDER BY SUM(visit.Total_spent) DESC LIMIT 1
SELECT museum.Museum_ID, museum.Name FROM museum JOIN visit ON museum.Museum_ID = visit.Museum_ID GROUP BY museum.Museum_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT visitor.Name, visitor.Age FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID WHERE visit.Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit)
SELECT AVG(Num_of_Ticket), MAX(Num_of_Ticket) FROM visit
SELECT SUM(Total_spent) FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE visitor.Level_of_membership = 1
SELECT v1.visitor_ID, c.Name FROM visit v1 JOIN visit v2 ON v1.visitor_ID = v2.visitor_ID JOIN museum m1 ON v1.Museum_ID = m1.Museum_ID JOIN museum m2 ON v2.Museum_ID = m2.Museum_ID JOIN visitor c ON v1.visitor_ID = c.ID WHERE m1.Open_Year < '2009' AND m2.Open_Year > '2011'
SELECT COUNT(DISTINCT visitor_ID) FROM visit WHERE visitor_ID NOT IN (SELECT visitor_ID FROM visit JOIN museum ON visit.Museum_ID = museum.Museum_ID WHERE museum.Open_Year > 2010)
SELECT COUNT(*) FROM museum WHERE Open_Year > '2013' OR Open_Year < '2008'
SELECT COUNT(player_id) FROM players
SELECT COUNT(player_id) FROM players
SELECT COUNT(*) FROM matches
SELECT COUNT(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT tourney_name, COUNT(*) as num_matches FROM matches GROUP BY tourney_name HAVING num_matches > 10 ORDER BY num_matches DESC LIMIT 1;
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT DISTINCT players.first_name, players.last_name FROM players JOIN matches AS m1 ON players.player_id = m1.winner_id JOIN matches AS m2 ON players.player_id = m2.winner_id WHERE m1.year = 2013 AND m2.year = 2016 ORDER BY players.last_name ASC
SELECT DISTINCT p.first_name, p.last_name FROM players p JOIN matches m1 ON p.player_id = m1.winner_id AND m1.year = 2013 JOIN matches m2 ON p.player_id = m2.winner_id AND m2.year = 2016
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016
SELECT players.country_code, players.first_name FROM players JOIN matches ON matches.winner_id = players.player_id WHERE matches.tourney_name = 'WTA Championships' AND matches.tourney_id LIKE '%Australian Open%' GROUP BY players.player_id HAVING COUNT(DISTINCT matches.tourney_name) = 2
SELECT p.first_name, p.country_code FROM players p JOIN matches m1 ON p.player_id = m1.winner_id JOIN matches m2 ON p.player_id = m2.winner_id WHERE m1.tourney_name = 'WTA Championships' AND m2.tourney_name = 'Australian Open'
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
ERROR
ERROR
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date;
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT players.first_name, players.country_code FROM players JOIN rankings ON players.player_id = rankings.player_id WHERE rankings.tours = (SELECT MAX(tours) FROM rankings) LIMIT 1;
SELECT players.first_name, players.country_code FROM players JOIN rankings ON players.player_id = rankings.player_id ORDER BY rankings.tours DESC LIMIT 1;
SELECT year, COUNT(*) as num_matches FROM matches GROUP BY year ORDER BY num_matches DESC LIMIT 1;
SELECT year, COUNT(*) as num_matches FROM matches GROUP BY year ORDER BY num_matches DESC LIMIT 1;
ERROR
SELECT winner_name, winner_rank_points FROM matches JOIN rankings ON matches.winner_id = rankings.player_id GROUP BY winner_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT players.first_name, players.last_name, matches.winner_rank_points FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'Australian Open' ORDER BY matches.winner_rank_points DESC LIMIT 1;
SELECT players.first_name, players.last_name, matches.winner_rank_points FROM matches JOIN players ON matches.winner_id = players.player_id WHERE matches.tourney_name = 'Australian Open' ORDER BY matches.winner_rank_points DESC LIMIT 1;
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1;
SELECT players.first_name, AVG(rankings.ranking) AS avg_ranking FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id
SELECT players.first_name, AVG(rankings.ranking) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name
SELECT players.first_name, SUM(rankings.ranking_points) AS total_points FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id ORDER BY total_points DESC
SELECT players.first_name, SUM(rankings.ranking_points) as total_points FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name ORDER BY total_points DESC
SELECT players.country_code, COUNT(players.player_id) AS num_players FROM players GROUP BY players.country_code ORDER BY num_players DESC
SELECT country_code, COUNT(player_id) AS num_players FROM players GROUP BY country_code ORDER BY num_players DESC
SELECT country_code, COUNT(*) as num_players FROM players GROUP BY country_code ORDER BY num_players DESC LIMIT 1;
SELECT country_code, COUNT(*) as num_players FROM players GROUP BY country_code ORDER BY num_players DESC LIMIT 1;
SELECT country_code, COUNT(player_id) AS num_players FROM players GROUP BY country_code HAVING num_players > 50 ORDER BY num_players DESC
SELECT country_code, COUNT(player_id) AS num_players FROM players GROUP BY country_code HAVING num_players > 50 ORDER BY num_players DESC
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date ORDER BY ranking_date ASC
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date
SELECT year, COUNT(*) FROM matches GROUP BY year ORDER BY year
SELECT year, COUNT(*) FROM matches GROUP BY year ORDER BY year ASC
SELECT winner_name, winner_rank, winner_age FROM matches JOIN players ON matches.winner_id = players.player_id WHERE winner_age IS NOT NULL ORDER BY winner_age ASC LIMIT 3
SELECT winner_name, winner_rank, winner_age FROM matches JOIN players ON matches.winner_id = players.player_id WHERE winner_age IS NOT NULL ORDER BY winner_age ASC LIMIT 3
SELECT COUNT(DISTINCT winner_id) FROM matches JOIN players ON matches.winner_id = players.player_id WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L'
SELECT COUNT(DISTINCT winner_id) FROM matches JOIN players ON matches.winner_id = players.player_id WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships'
SELECT players.first_name, players.country_code, players.birth_date FROM players JOIN matches ON players.player_id = matches.winner_id JOIN rankings ON players.player_id = rankings.player_id WHERE rankings.ranking_points = (SELECT MAX(rankings.ranking_points) FROM rankings)
SELECT players.first_name, players.country_code, players.birth_date FROM players JOIN matches ON matches.winner_id = players.player_id JOIN rankings ON rankings.player_id = players.player_id WHERE rankings.ranking_points = (SELECT MAX(rankings.ranking_points) FROM rankings) LIMIT 1;
SELECT hand, COUNT(player_id) AS num_players FROM players GROUP BY hand
SELECT hand, COUNT(player_id) AS num_players FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT ship.name, ship.tonnage FROM ship ORDER BY ship.name DESC
SELECT name, date, result FROM battle
SELECT battle.name, MAX(death.killed), MIN(death.killed) FROM battle JOIN ship ON battle.id = ship.lost_in_battle JOIN death ON ship.id = death.caused_by_ship_id GROUP BY battle.name
SELECT AVG(injured) FROM death
SELECT death.note, death.killed, death.injured FROM death JOIN ship ON death.caused_by_ship_id = ship.id WHERE ship.tonnage = 't'
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT battle.id, battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.ship_type = 'Brig'
SELECT battle.id, battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle JOIN death ON ship.id = death.caused_by_ship_id GROUP BY battle.id HAVING SUM(death.killed) > 10 ORDER BY SUM(death.killed) DESC
SELECT ship.id, ship.name, SUM(death.injured) AS total_injuries FROM ship JOIN death ON ship.id = death.caused_by_ship_id GROUP BY ship.id ORDER BY total_injuries DESC LIMIT 1
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225')
SELECT battle.name, battle.date FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.name = 'Lettice' OR ship.name = 'HMS Atalanta' GROUP BY battle.id HAVING COUNT(DISTINCT ship.name) = 2
SELECT name, result, bulgarian_commander FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE location = 'English Channel')
SELECT note FROM death WHERE note LIKE '%East%'
SELECT address_id, line_1, line_2 FROM Addresses
SELECT line_1, line_2 FROM Addresses
SELECT COUNT(*) FROM Courses
SELECT COUNT(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = 'Math'
ERROR
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT Departments.department_id, Departments.department_name, COUNT(Degree_Programs.degree_program_id) AS num_degrees FROM Departments JOIN Degree_Programs ON Departments.department_id = Degree_Programs.department_id GROUP BY Departments.department_id ORDER BY num_degrees DESC LIMIT 1;
ERROR
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs;
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering')
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering')
SELECT section_name, section_description FROM Sections
SELECT section_name, section_description FROM Sections
SELECT Courses.course_id, Courses.course_name FROM Courses INNER JOIN Sections ON Courses.course_id = Sections.course_id GROUP BY Courses.course_id HAVING COUNT(Sections.section_id) <= 2 ORDER BY Courses.course_id ASC
SELECT course_id, course_name FROM Courses WHERE course_id NOT IN (SELECT course_id FROM Sections GROUP BY course_id HAVING COUNT(*) >= 2) ORDER BY course_id ASC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT semesters.semester_id, semesters.semester_name, COUNT(student_enrolment.student_enrolment_id) AS num_students FROM student_enrolment JOIN semesters ON student_enrolment.semester_id = semesters.semester_id GROUP BY semesters.semester_id ORDER BY num_students DESC LIMIT 1;
SELECT semesters.semester_id, semesters.semester_name FROM student_enrolment JOIN semesters ON student_enrolment.semester_id = semesters.semester_id GROUP BY semesters.semester_id ORDER BY COUNT(DISTINCT student_enrolment.student_id) DESC LIMIT 1;
SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Student_Enrolment_Courses sec ON se.student_enrolment_id = sec.student_enrolment_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id JOIN Semesters sem ON se.semester_id = sem.semester_id GROUP BY s.student_id HAVING COUNT(DISTINCT dp.degree_program_id) = 2 AND COUNT(DISTINCT sem.semester_id) = 1 ORDER BY s.last_name, s.first_name
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2 AND COUNT(DISTINCT se.semester_id) = 1
SELECT first_name, middle_name, last_name FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name LIKE '%Bachelor%'
SELECT first_name, middle_name, last_name FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name LIKE '%Bachelors%'
SELECT Degree_Programs.degree_summary_name, COUNT(Student_Enrolment.student_id) AS num_students FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_summary_name ORDER BY num_students DESC LIMIT 1;
SELECT Degree_Programs.degree_summary_name, COUNT(Student_Enrolment.student_id) AS num_students FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_summary_name ORDER BY num_students DESC LIMIT 1;
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_name FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id ORDER BY COUNT(Student_Enrolment.student_id) DESC LIMIT 1;
ERROR
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(*) AS num_enrollments FROM Student_Enrolment s_e JOIN Students s ON s_e.student_id = s.student_id GROUP BY s.student_id ORDER BY num_enrollments DESC LIMIT 1;
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(sec.course_id) AS num_enrollments FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Student_Enrolment_Courses sec ON se.student_enrolment_id = sec.student_enrolment_id GROUP BY s.student_id ORDER BY num_enrollments DESC LIMIT 1;
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT DISTINCT course_name FROM Courses INNER JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id
SELECT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses) ORDER BY course_name ASC
SELECT Courses.course_name, COUNT(Student_Enrolment_Courses.student_course_id) AS enrollments FROM Courses JOIN Sections ON Courses.course_id = Sections.course_id JOIN Student_Enrolment_Courses ON Sections.section_id = Student_Enrolment_Courses.course_id GROUP BY Courses.course_id ORDER BY enrollments DESC LIMIT 1;
SELECT Courses.course_name, COUNT(Student_Enrolment_Courses.student_course_id) AS num_students FROM Courses JOIN Sections ON Courses.course_id = Sections.course_id JOIN Student_Enrolment_Courses ON Sections.section_id = Student_Enrolment_Courses.course_id GROUP BY Courses.course_id ORDER BY num_students DESC LIMIT 1;
SELECT last_name FROM Students JOIN Addresses ON Students.current_address_id = Addresses.address_id WHERE Addresses.state_province_county = 'North Carolina' AND Students.student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND student_id NOT IN (SELECT student_id FROM Student_Enrolment)
ERROR
ERROR
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1;
ERROR
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1;
SELECT s.first_name FROM Students s JOIN Addresses pa ON s.permanent_address_id = pa.address_id JOIN Addresses ca ON s.current_address_id = ca.address_id WHERE pa.line_1 != ca.line_1 OR pa.line_2 != ca.line_2 OR pa.line_3 != ca.line_3 OR pa.city != ca.city OR pa.zip_postcode != ca.zip_postcode OR pa.state_province_county != ca.state_province_county OR pa.country != ca.country
SELECT s.first_name FROM Students s JOIN Addresses pa ON s.permanent_address_id = pa.address_id JOIN Addresses ca ON s.current_address_id = ca.address_id WHERE pa.line_1 != ca.line_1 OR pa.line_2 != ca.line_2 OR pa.line_3 != ca.line_3 OR pa.city != ca.city OR pa.zip_postcode != ca.zip_postcode OR pa.state_province_county != ca.state_province_county OR pa.country != ca.country
SELECT current_address_id, COUNT(*) AS num_students, line_1, line_2, line_3, city, zip_postcode, state_province_county, country, other_address_details FROM Students JOIN Addresses ON Students.current_address_id = Addresses.address_id GROUP BY current_address_id ORDER BY num_students DESC LIMIT 1
SELECT a.address_id, a.line_1, a.line_2 FROM Students s JOIN Addresses a ON s.permanent_address_id = a.address_id GROUP BY a.address_id ORDER BY COUNT(s.student_id) DESC LIMIT 1;
SELECT AVG(strftime('%s', transcript_date)) AS avg_transcript_date FROM Transcripts
SELECT AVG(transcript_date) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1;
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1;
SELECT COUNT(*) FROM Transcripts
SELECT COUNT(*) FROM Transcripts
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1;
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1;
SELECT student_course_id, COUNT(DISTINCT transcript_id) AS max_enrollment_count FROM Transcript_Contents GROUP BY student_course_id ORDER BY max_enrollment_count DESC LIMIT 1
ERROR
SELECT transcript_id, transcript_date FROM Transcripts ORDER BY transcript_id LIMIT 1
SELECT transcript_id, transcript_date FROM Transcripts ORDER BY (SELECT COUNT(*) FROM Transcript_Contents WHERE Transcript_Contents.transcript_id = Transcripts.transcript_id) ASC LIMIT 1;
SELECT Semesters.semester_name FROM Semesters INNER JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id INNER JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name LIKE '%Bachelor%' AND Semesters.semester_name IN ( SELECT Semesters.semester_name FROM Semesters INNER JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id INNER JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name LIKE '%Master%' )
SELECT se.semester_id FROM Student_Enrolment se INNER JOIN Student_Enrolment_Courses sec ON se.student_enrolment_id = sec.student_enrolment_id INNER JOIN Courses c ON sec.course_id = c.course_id INNER JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id INNER JOIN Departments d ON dp.department_id = d.department_id INNER JOIN Sections s ON c.course_id = s.course_id INNER JOIN Semesters sem ON se.semester_id = sem.semester_id WHERE dp.degree_summary_name IN ('Masters', 'Bachelors') GROUP BY se.semester_id HAVING COUNT(DISTINCT dp.degree_summary_name) = 2
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT DISTINCT Addresses.address_id, Addresses.line_1, Addresses.line_2, Addresses.line_3, Addresses.city, Addresses.zip_postcode, Addresses.state_province_county, Addresses.country, Addresses.other_address_details FROM Addresses INNER JOIN Students ON Addresses.address_id = Students.current_address_id OR Addresses.address_id = Students.permanent_address_id
SELECT * FROM Students ORDER BY last_name DESC
SELECT * FROM Students ORDER BY last_name DESC
ERROR
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students JOIN Addresses ON Students.permanent_address_id = Addresses.address_id WHERE Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582' ORDER BY first_name ASC
SELECT first_name FROM Students JOIN Addresses ON Students.permanent_address_id = Addresses.address_id WHERE country = 'Haiti' OR cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Cartoon.Title, Cartoon.Original_air_date, TV_Channel.id, TV_Channel.series_name FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Directed_by = "Ben Jones"
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = "Joseph Kuhr"
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Cartoon.Title, Cartoon.Directed_by, Cartoon.Original_air_date FROM Cartoon JOIN TV_series ON Cartoon.Channel = TV_series.Channel JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id ORDER BY TV_series.Air_Date ASC
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti"
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT TV_Channel.Country, COUNT(TV_Channel.id) AS Num_Channels FROM TV_Channel GROUP BY TV_Channel.Country ORDER BY Num_Channels DESC LIMIT 1;
SELECT TV_Channel.country, COUNT(TV_Channel.id) AS num_channels FROM TV_Channel GROUP BY TV_Channel.country ORDER BY num_channels DESC LIMIT 1;
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT content) FROM TV_Channel
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio"
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = "Sky Radio"
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT TV_Channel.language, COUNT(TV_Channel.id) AS num_channels FROM TV_Channel GROUP BY TV_Channel.language ORDER BY num_channels ASC LIMIT 1;
SELECT TV_Channel.language, COUNT(*) AS num_channels FROM TV_Channel GROUP BY TV_Channel.language ORDER BY num_channels ASC LIMIT 1;
SELECT TV_Channel.language, COUNT(TV_Channel.id) AS num_channels FROM TV_Channel GROUP BY TV_Channel.language ORDER BY num_channels DESC
SELECT TV_Channel.Language, COUNT(TV_Channel.id) AS Num_Channels FROM TV_Channel GROUP BY TV_Channel.Language ORDER BY Num_Channels DESC
SELECT TV_Channel.id, TV_Channel.series_name FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Title = "The Rise of the Blue Beetle!"
SELECT TV_Channel.series_name FROM TV_Channel JOIN Cartoon ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Title = "The Rise of the Blue Beetle"
SELECT Cartoon.Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = "Sky Radio"
SELECT Cartoon.Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = "Sky Radio"
SELECT Episode FROM TV_series ORDER BY Rating DESC
SELECT TV_series.Episode, TV_series.Rating FROM TV_series ORDER BY TV_series.Rating DESC
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(share), MAX(share) FROM TV_series
SELECT MAX(share), MIN(share) FROM TV_series
SELECT TV_series.Air_Date FROM TV_series WHERE TV_series.Episode = "A Love of a Lifetime"
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT TV_series.Weekly_Rank FROM TV_series JOIN Cartoon ON Cartoon.id = TV_series.id WHERE Cartoon.Title = "A Love of a Lifetime"
SELECT TV_series.weekly_rank FROM TV_series JOIN Cartoon ON Cartoon.Title = "A Love of a Lifetime" AND Cartoon.Channel = TV_series.Channel
SELECT TV_Channel.id, TV_Channel.series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_series.Episode = "A Love of a Lifetime"
SELECT TV_Channel.series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_series.Episode = "A Love of a Lifetime"
SELECT TV_series.Episode FROM TV_series JOIN TV_Channel ON TV_series.Channel = TV_Channel.id WHERE TV_Channel.series_name = "Sky Radio"
SELECT TV_series.Episode FROM TV_series JOIN TV_Channel ON TV_series.Channel = TV_Channel.id WHERE TV_Channel.series_name = "Sky Radio"
SELECT Directed_by, COUNT(*) AS num_cartoons FROM Cartoon GROUP BY Directed_by ORDER BY num_cartoons DESC
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon WHERE Original_air_date = (SELECT MAX(Original_air_date) FROM Cartoon)
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT TV_Channel.package_option, TV_Channel.series_name FROM TV_Channel WHERE TV_Channel.hight_definition_tv = 'Yes'
SELECT package_option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes'
SELECT DISTINCT TV_Channel.country FROM TV_Channel JOIN Cartoon ON Cartoon.channel = TV_Channel.id WHERE Cartoon.written_by = 'Todd Casey'
SELECT DISTINCT TV_Channel.Country FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Written_by = 'Todd Casey'
SELECT DISTINCT TV_Channel.country FROM TV_Channel WHERE TV_Channel.id NOT IN ( SELECT Cartoon.channel FROM Cartoon WHERE Cartoon.written_by = 'Todd Casey' )
SELECT DISTINCT TV_Channel.Country FROM TV_Channel LEFT JOIN TV_series ON TV_Channel.id = TV_series.Channel LEFT JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by != 'Todd Casey' OR Cartoon.Written_by IS NULL ORDER BY TV_Channel.Country ASC
SELECT DISTINCT TV_Channel.series_name, TV_Channel.Country FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Directed_by IN ('Ben Jones', 'Michael Chang')
SELECT DISTINCT TV_Channel.series_name, TV_Channel.country FROM TV_Channel JOIN Cartoon ON Cartoon.channel = TV_Channel.id WHERE Cartoon.directed_by = 'Ben Jones' OR Cartoon.directed_by = 'Michael Chang'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT TV_Channel.id FROM TV_Channel WHERE TV_Channel.country IN (SELECT TV_Channel.country FROM TV_Channel GROUP BY TV_Channel.country HAVING COUNT(*) > 2)
SELECT id FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon GROUP BY Channel HAVING COUNT(DISTINCT id) > 2) OR id IN (SELECT Channel FROM TV_series GROUP BY Channel HAVING COUNT(DISTINCT id) > 2)
SELECT TV_Channel.id FROM TV_Channel WHERE TV_Channel.id NOT IN ( SELECT Cartoon.channel FROM Cartoon WHERE Cartoon.Directed_by = 'Ben Jones' )
SELECT DISTINCT TV_Channel.id FROM TV_Channel LEFT JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Directed_by != 'Ben Jones' OR Cartoon.Directed_by IS NULL
SELECT TV_Channel.package_option FROM TV_Channel WHERE TV_Channel.id NOT IN ( SELECT Cartoon.channel FROM Cartoon WHERE Cartoon.directed_by = 'Ben Jones' )
SELECT TV_Channel.package_option FROM TV_Channel WHERE TV_Channel.id NOT IN (SELECT Cartoon.channel FROM Cartoon WHERE Cartoon.directed_by = 'Ben Jones')
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) FROM poker_player
SELECT earnings FROM poker_player ORDER BY earnings DESC
SELECT earnings FROM poker_player ORDER BY earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT final_table_made, best_finish FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT money_rank FROM poker_player WHERE earnings = (SELECT MAX(earnings) FROM poker_player)
SELECT money_rank FROM poker_player WHERE earnings = (SELECT MAX(earnings) FROM poker_player)
SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000
SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000
SELECT Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID
SELECT Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.Earnings > 300000 ORDER BY pp.Earnings DESC
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE pp.Earnings > 300000 ORDER BY pp.Earnings DESC
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Final_Table_Made ASC
SELECT p.Name, pp.Final_Table_Made FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Final_Table_Made ASC
SELECT p.Birth_Date FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings ASC LIMIT 1;
SELECT p.Birth_Date FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings ASC LIMIT 1;
SELECT poker_player.money_rank FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY people.height DESC LIMIT 1
SELECT poker_player.money_rank FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY people.height DESC LIMIT 1
SELECT AVG(earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE height > 200
SELECT AVG(earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE height > 200
SELECT p.Name, pp.Earnings FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings DESC
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings DESC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(*) as count FROM people GROUP BY Nationality ORDER BY count DESC LIMIT 1
SELECT Nationality, COUNT(*) as count FROM people GROUP BY Nationality ORDER BY count DESC LIMIT 1;
SELECT DISTINCT p1.Nationality FROM people p1 INNER JOIN people p2 ON p1.Nationality = p2.Nationality AND p1.People_ID <> p2.People_ID
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name FROM people WHERE Nationality != "Russia"
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE
SELECT MAX(created) FROM votes WHERE state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES
SELECT contestants.contestant_number, contestants.contestant_name FROM contestants INNER JOIN votes ON contestants.contestant_number = votes.contestant_number GROUP BY contestants.contestant_number, contestants.contestant_name HAVING COUNT(votes.vote_id) >= 2
SELECT c.contestant_number, c.contestant_name, COUNT(v.vote_id) AS vote_count FROM CONTESTANTS c LEFT JOIN VOTES v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number ORDER BY vote_count ASC LIMIT 1;
SELECT COUNT(*) FROM VOTES WHERE state = 'NY' OR state = 'CA'
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
ERROR
SELECT created, state, phone_number FROM VOTES WHERE contestant_number = (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Tabatha Gehling')
SELECT DISTINCT a.area_code FROM AREA_CODE_STATE a JOIN VOTES v1 ON a.state = v1.state JOIN VOTES v2 ON v1.phone_number = v2.phone_number AND v1.state = v2.state JOIN CONTESTANTS c1 ON v1.contestant_number = c1.contestant_number AND c1.contestant_name = 'Tabatha Gehling' JOIN CONTESTANTS c2 ON v2.contestant_number = c2.contestant_number AND c2.contestant_name = 'Kelly Clauss'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
ERROR
ERROR
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Caribbean'
SELECT country.Continent FROM country JOIN city ON country.Code = city.CountryCode WHERE city.Name = 'Anguilla'
SELECT country.Continent FROM country JOIN city ON country.Code = city.CountryCode WHERE city.Name = 'Anguilla'
SELECT country.Region FROM city JOIN country ON city.CountryCode = country.Code WHERE city.Name = 'Kabul'
SELECT country.Region FROM city JOIN country ON city.CountryCode = country.Code WHERE city.Name = 'Kabul'
SELECT Language FROM countrylanguage WHERE CountryCode='ABW' AND IsOfficial='T' ORDER BY Percentage DESC LIMIT 1;
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' AND IsOfficial = 'T'
ERROR
ERROR
SELECT region, population FROM country WHERE name = 'Angola'
SELECT country.Region, country.Population FROM country WHERE country.Name = 'Angola'
ERROR
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Central Africa'
SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND countrylanguage.IsOfficial = 'T' ORDER BY country.LifeExpectancy ASC LIMIT 1
ERROR
SELECT SUM(country.Population), MAX(country.GNP) FROM country WHERE country.Continent = 'Asia'
ERROR
ERROR
ERROR
ERROR
ERROR
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT AVG(country.GNP), SUM(country.Population) FROM country WHERE country.GovernmentForm = 'US Territory'
SELECT AVG(country.GNP), SUM(country.Population) FROM country WHERE country.Continent = 'North America' AND country.Region = 'Caribbean' AND country.Code IN (SELECT city.CountryCode FROM city WHERE city.Name = 'San Juan')
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AF' AND IsOfficial = 'T'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AF' AND IsOfficial = 'T'
SELECT country.Name, COUNT(DISTINCT countrylanguage.Language) AS num_languages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Code ORDER BY num_languages DESC LIMIT 1;
SELECT country.Name, COUNT(DISTINCT countrylanguage.Language) AS num_languages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Code ORDER BY num_languages DESC LIMIT 1;
SELECT country.Continent, COUNT(DISTINCT countrylanguage.Language) AS NumLanguages FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code GROUP BY country.Continent ORDER BY NumLanguages DESC LIMIT 1;
SELECT country.Continent, COUNT(DISTINCT countrylanguage.Language) AS NumLanguages FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code GROUP BY country.Continent ORDER BY NumLanguages DESC LIMIT 1;
SELECT COUNT(DISTINCT cl.CountryCode) FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' AND cl.CountryCode IN (SELECT cl2.CountryCode FROM countrylanguage cl2 WHERE cl2.Language = 'Dutch' AND cl2.IsOfficial = 'T')
SELECT COUNT(DISTINCT cl.CountryCode) FROM countrylanguage cl WHERE cl.Language IN ('English', 'Dutch') AND cl.IsOfficial = 'T'
SELECT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T' JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T' ORDER BY c.Name ASC
SELECT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T' JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T' ORDER BY c.Name ASC
SELECT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T' JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T'
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' INTERSECT SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'French' AND cl.IsOfficial = 'T' ORDER BY c.Name ASC
SELECT COUNT(DISTINCT c.Continent) FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE cl.Language = 'Chinese'
SELECT COUNT(DISTINCT country.Continent) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T'
SELECT DISTINCT c.Region FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE cl.Language IN ('English', 'Dutch') ORDER BY c.Region
SELECT DISTINCT c.Region FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE cl.Language IN ('Dutch', 'English') ORDER BY c.Region
SELECT DISTINCT country.Name FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE (countrylanguage.Language = 'English' OR countrylanguage.Language = 'Dutch') AND countrylanguage.IsOfficial = 'T'
SELECT DISTINCT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE (cl.Language = 'English' OR cl.Language = 'Dutch') AND cl.IsOfficial = 'T' ORDER BY c.Name ASC
SELECT Language, SUM(Population * Percentage) AS TotalPopulation FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE continent = 'Asia' AND IsOfficial = 'T' GROUP BY Language ORDER BY TotalPopulation DESC LIMIT 1;
SELECT cl.Language, COUNT(DISTINCT c.Code) AS NumCountries FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.Continent = 'Asia' AND cl.IsOfficial = 'T' GROUP BY cl.Language ORDER BY NumCountries DESC LIMIT 1;
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm LIKE '%Republic%' AND cl.Percentage = 100 AND cl.Language NOT IN ( SELECT cl2.Language FROM countrylanguage cl2 JOIN country c2 ON cl2.CountryCode = c2.Code WHERE c2.GovernmentForm LIKE '%Republic%' GROUP BY cl2.Language HAVING COUNT(DISTINCT c2.Code) > 1 )
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm = 'Republic' GROUP BY cl.Language HAVING COUNT(DISTINCT cl.CountryCode) = 1
ERROR
SELECT city.Name, city.Population FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' ORDER BY city.Population DESC LIMIT 1;
SELECT country.Name, country.Population, country.LifeExpectancy FROM country WHERE continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT country.Name, country.Population, country.LifeExpectancy FROM country WHERE country.Continent = 'Asia' ORDER BY country.SurfaceArea DESC LIMIT 1
ERROR
ERROR
SELECT SUM(c.population) FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language != 'English'
ERROR
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.HeadOfState = 'Beatrix' AND cl.IsOfficial = 'T'
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.HeadOfState = 'Beatrix' AND cl.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN (SELECT Code FROM country WHERE IndepYear < 1930)
SELECT COUNT(DISTINCT Language) FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE country.IndepYear < 1930 AND countrylanguage.IsOfficial = 'T'
SELECT c.Name FROM country c WHERE c.SurfaceArea > (SELECT MAX(c2.SurfaceArea) FROM country c2 WHERE c2.Continent = 'Europe')
SELECT c.Name FROM country c WHERE c.Continent <> 'Europe' AND c.SurfaceArea > (SELECT MAX(c2.SurfaceArea) FROM country c2 WHERE c2.Continent = 'Europe') ORDER BY c.SurfaceArea DESC
SELECT c.Name, c.Population FROM country c WHERE c.Continent = 'Africa' AND c.Population < (SELECT MIN(c2.Population) FROM country c2 WHERE c2.Continent = 'Asia') ORDER BY c.Population ASC
SELECT c.Name, c.Population FROM country c WHERE c.Continent = 'Africa' AND c.Population < (SELECT MIN(c2.Population) FROM country c2 WHERE c2.Continent = 'Asia') ORDER BY c.Population ASC LIMIT 10;
SELECT c.Name, c.Population FROM country c WHERE c.Continent = 'Asia' AND c.Population > (SELECT MAX(c2.Population) FROM country c2 WHERE c2.Continent = 'Africa') ORDER BY c.Population DESC LIMIT 10;
SELECT c.Name, c.Population FROM country c WHERE c.Continent = 'Asia' AND c.Population > (SELECT MAX(c2.Population) FROM country c2 WHERE c2.Continent = 'Africa') ORDER BY c.Population DESC LIMIT 10;
SELECT DISTINCT country.Code FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language != 'English'
SELECT DISTINCT country.Code FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT DISTINCT cl.CountryCode FROM countrylanguage cl WHERE cl.Language != 'English'
SELECT DISTINCT country.Code FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language != 'English'
SELECT DISTINCT country.Code FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language != 'English' AND country.GovernmentForm != 'Republic'
SELECT DISTINCT country.Code FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language != 'English' AND country.GovernmentForm NOT LIKE '%Republic%'
ERROR
SELECT city.Name FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Europe' AND countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F' ORDER BY city.Name ASC
ERROR
SELECT DISTINCT city.Name FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T' ORDER BY city.Name ASC
SELECT c.Name, c.IndepYear, c.SurfaceArea FROM country c WHERE c.Population = (SELECT MIN(Population) FROM country) ORDER BY c.SurfaceArea ASC LIMIT 1
SELECT country.Name, country.IndepYear, country.SurfaceArea FROM country ORDER BY country.Population ASC LIMIT 1;
SELECT c.Name, c.Population, c.HeadOfState FROM country c WHERE c.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1;
SELECT country.Name, COUNT(countrylanguage.Language) AS NumLanguages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Code HAVING COUNT(countrylanguage.Language) >= 3 ORDER BY NumLanguages DESC
SELECT country.Name, COUNT(DISTINCT countrylanguage.Language) AS NumLanguages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Name HAVING NumLanguages > 2 ORDER BY NumLanguages DESC
SELECT district, COUNT(*) FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district ORDER BY COUNT(*) DESC
SELECT district, COUNT(*) FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district ORDER BY COUNT(*) DESC
ERROR
SELECT c.GovernmentForm, SUM(c.Population) FROM country c WHERE c.LifeExpectancy > 72 GROUP BY c.GovernmentForm ORDER BY SUM(c.Population) DESC
SELECT country.Continent, AVG(country.LifeExpectancy) AS avg_life_expectancy, SUM(country.Population) AS total_population FROM country WHERE country.LifeExpectancy < 72 GROUP BY country.Continent
ERROR
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT COUNT(*) FROM country WHERE continent = 'Asia'
SELECT COUNT(*) FROM country WHERE continent = 'Asia'
SELECT country.Name FROM country JOIN city ON country.Code = city.CountryCode WHERE country.Continent = 'Europe' AND city.Population = 80000
SELECT country.Name FROM country JOIN city ON country.Code = city.CountryCode WHERE country.Continent = 'Europe' AND city.Population = 80000
ERROR
ERROR
SELECT name, population FROM city WHERE population BETWEEN 160000 AND 900000 ORDER BY population DESC
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000 ORDER BY Population DESC
SELECT language, COUNT(DISTINCT CountryCode) AS num_countries FROM countrylanguage GROUP BY language ORDER BY num_countries DESC LIMIT 1;
SELECT Language, COUNT(DISTINCT CountryCode) AS NumCountries FROM countrylanguage GROUP BY Language ORDER BY NumCountries DESC LIMIT 1;
SELECT c.Name, cl.Language, cl.Percentage FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = c.Code) ORDER BY c.Name ASC
SELECT cl.CountryCode, cl.Language FROM countrylanguage cl WHERE cl.Percentage = ( SELECT MAX(cl2.Percentage) FROM countrylanguage cl2 WHERE cl2.CountryCode = cl.CountryCode ) ORDER BY cl.CountryCode ASC
SELECT COUNT(DISTINCT cl.CountryCode) FROM countrylanguage cl WHERE cl.Language = 'Spanish' AND cl.Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish' )
SELECT COUNT(DISTINCT cl.CountryCode) FROM countrylanguage cl WHERE cl.Language = 'Spanish' AND cl.IsOfficial = 'T'
SELECT cl.CountryCode, MAX(cl.Percentage) AS MaxPercentage FROM countrylanguage cl WHERE cl.Language = 'Spanish' GROUP BY cl.CountryCode ORDER BY MaxPercentage DESC LIMIT 1;
SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language = 'Spanish' AND cl.IsOfficial = 'T' ORDER BY cl.Percentage DESC
SELECT COUNT(*) FROM conductor
SELECT COUNT(*) FROM conductor
SELECT Name, Age FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age
SELECT name FROM conductor WHERE nationality != "USA"
SELECT Name FROM conductor WHERE Nationality != "USA"
SELECT orchestra.record_company FROM orchestra ORDER BY orchestra.year_of_founded DESC
SELECT orchestra.record_company FROM orchestra ORDER BY orchestra.year_of_founded DESC
SELECT AVG(Attendance) FROM show
SELECT AVG(Attendance) FROM show
SELECT MAX(share), MIN(share) FROM performance WHERE type != "Live final"
SELECT MAX(share), MIN(share) FROM performance WHERE type != "Live final"
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name, Year_of_Work FROM conductor ORDER BY Year_of_Work DESC
SELECT Name, Year_of_Work FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT conductor.Name FROM conductor ORDER BY conductor.Year_of_Work DESC LIMIT 1
SELECT conductor.Name, orchestra.Orchestra FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID
SELECT conductor.Name, orchestra.Orchestra FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID HAVING COUNT(DISTINCT o.Orchestra_ID) > 1 ORDER BY c.Name ASC
SELECT conductor.name FROM conductor JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id GROUP BY conductor.name HAVING COUNT(DISTINCT orchestra.orchestra_id) > 1 ORDER BY conductor.name ASC
SELECT conductor.Name, COUNT(DISTINCT orchestra.Orchestra_ID) AS num_orchestras FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID ORDER BY num_orchestras DESC LIMIT 1;
SELECT conductor.Name, COUNT(DISTINCT orchestra.Orchestra_ID) AS num_orchestras FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID ORDER BY num_orchestras DESC LIMIT 1;
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008
SELECT orchestra.Record_Company, COUNT(DISTINCT orchestra.Orchestra_ID) AS num_orchestras FROM orchestra GROUP BY orchestra.Record_Company
SELECT record_company, COUNT(DISTINCT orchestra_id) FROM orchestra GROUP BY record_company
SELECT Major_Record_Format, COUNT(*) AS Count FROM orchestra GROUP BY Major_Record_Format ORDER BY Count ASC
SELECT major_record_format, COUNT(*) as frequency FROM orchestra GROUP BY major_record_format ORDER BY frequency DESC
SELECT orchestra.Record_Company, COUNT(DISTINCT orchestra.Orchestra_ID) AS num_orchestras FROM orchestra GROUP BY orchestra.Record_Company ORDER BY num_orchestras DESC LIMIT 1;
SELECT orchestra.record_company, COUNT(DISTINCT orchestra.orchestra_id) AS num_orchestras FROM orchestra GROUP BY orchestra.record_company ORDER BY num_orchestras DESC LIMIT 1;
SELECT orchestra.Orchestra FROM orchestra LEFT JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID WHERE performance.Performance_ID IS NULL
SELECT orchestra.Orchestra FROM orchestra LEFT JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID WHERE performance.Performance_ID IS NULL
SELECT orchestra.Record_Company FROM orchestra WHERE orchestra.Year_of_Founded < 2003 INTERSECT SELECT orchestra.Record_Company FROM orchestra WHERE orchestra.Year_of_Founded > 2003
SELECT DISTINCT o1.record_company FROM orchestra o1 JOIN orchestra o2 ON o1.record_company = o2.record_company WHERE o1.year_of_founded < 2003 AND o2.year_of_founded > 2003
SELECT COUNT(DISTINCT orchestra.Orchestra_ID) FROM orchestra WHERE orchestra.Major_Record_Format = "CD" OR orchestra.Major_Record_Format = "DVD"
SELECT COUNT(*) FROM orchestra WHERE major_record_format IN ('CD', 'DVD')
SELECT DISTINCT year_of_founded FROM orchestra WHERE orchestra_id IN ( SELECT orchestra_id FROM performance GROUP BY orchestra_id HAVING COUNT(*) > 1 ) ORDER BY year_of_founded
SELECT orchestra.year_of_founded FROM orchestra JOIN performance ON orchestra.orchestra_id = performance.orchestra_id GROUP BY orchestra.orchestra_id HAVING COUNT(DISTINCT performance.performance_id) > 1
SELECT COUNT(*) FROM Highschooler
SELECT COUNT(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT ID, name, grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade ORDER BY grade
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade, COUNT(*) AS num_highschoolers FROM Highschooler GROUP BY grade ORDER BY num_highschoolers DESC LIMIT 1;
ERROR
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4 ORDER BY grade ASC
SELECT student_id, COUNT(friend_id) AS num_friends FROM Friend GROUP BY student_id ORDER BY num_friends DESC
SELECT Highschooler.ID, Highschooler.name, Highschooler.grade, COUNT(Friend.friend_id) AS num_friends FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY num_friends DESC
SELECT Highschooler.name, COUNT(Friend.friend_id) AS num_friends FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY num_friends DESC
SELECT Highschooler.name, COUNT(Friend.friend_id) FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY COUNT(Friend.friend_id) DESC
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY COUNT(Friend.friend_id) DESC LIMIT 1;
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY COUNT(Friend.friend_id) DESC LIMIT 1;
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID HAVING COUNT(Friend.friend_id) >= 3 ORDER BY Highschooler.name ASC
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID HAVING COUNT(Friend.friend_id) >= 3 ORDER BY Highschooler.name ASC
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.friend_id JOIN Highschooler k ON k.ID = f.student_id WHERE k.name = 'Kyle' ORDER BY h.name
SELECT h2.name FROM Highschooler h1, Highschooler h2, Friend f WHERE h1.name = 'Kyle' AND h1.ID = f.student_id AND f.friend_id = h2.ID ORDER BY h2.name
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT h.ID FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id WHERE f.friend_id IS NULL
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT DISTINCT h.ID FROM Highschooler h JOIN Friend f ON h.ID = f.student_id JOIN Likes l ON h.ID = l.liked_id ORDER BY h.ID;
SELECT DISTINCT f.student_id FROM Friend f JOIN Likes l ON f.student_id = l.student_id ORDER BY f.student_id ASC
SELECT DISTINCT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id JOIN Likes ON Highschooler.ID = Likes.student_id WHERE Friend.friend_id IS NOT NULL AND Likes.liked_id <> Highschooler.ID ORDER BY Highschooler.name ASC
SELECT DISTINCT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id JOIN Likes ON Highschooler.ID = Likes.student_id WHERE Friend.friend_id IN (SELECT ID FROM Highschooler) AND Likes.liked_id IN (SELECT ID FROM Highschooler) ORDER BY Highschooler.name ASC
SELECT student_id, COUNT(liked_id) FROM Likes GROUP BY student_id
SELECT likes.student_id, COUNT(likes.liked_id) FROM likes GROUP BY likes.student_id
SELECT Highschooler.ID, Highschooler.name, Highschooler.grade, COUNT(Likes.liked_id) AS num_likes FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID
SELECT Highschooler.name, COUNT(Likes.liked_id) FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID ORDER BY COUNT(Likes.liked_id) DESC
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Likes.student_id ORDER BY COUNT(Likes.liked_id) DESC LIMIT 1;
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Likes.student_id ORDER BY COUNT(Likes.liked_id) DESC LIMIT 1;
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Likes.student_id HAVING COUNT(Likes.liked_id) >= 2 ORDER BY Highschooler.name ASC
SELECT h.name FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID HAVING COUNT(l.liked_id) >= 2 ORDER BY h.name ASC
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id WHERE h.grade > 5 GROUP BY h.ID HAVING COUNT(f.friend_id) >= 2 ORDER BY h.name ASC
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id WHERE h.grade > 5 GROUP BY h.ID HAVING COUNT(f.friend_id) >= 2
SELECT COUNT(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT AVG(H.grade) FROM Highschooler H WHERE H.ID IN (SELECT F.student_id FROM Friend F)
SELECT AVG(H.grade) FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY F.student_id
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
ERROR
SELECT DISTINCT Owners.state FROM Owners JOIN Professionals ON Owners.state = Professionals.state ORDER BY Owners.state
SELECT AVG(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT AVG(age) FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) > 2 ) ORDER BY last_name ASC
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) > 2 ) ORDER BY last_name ASC
SELECT Dogs.name FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Treatments.cost_of_treatment <= 1000 GROUP BY Dogs.name
SELECT d.name FROM Dogs d JOIN Owners o ON d.owner_id = o.owner_id JOIN Treatments t ON d.dog_id = t.dog_id WHERE t.cost_of_treatment <= 1000 GROUP BY d.name
SELECT DISTINCT owners.first_name AS name FROM owners LEFT JOIN dogs ON owners.owner_id = dogs.owner_id LEFT JOIN professionals ON owners.first_name = professionals.first_name WHERE dogs.name IS NULL OR professionals.first_name IS NOT NULL ORDER BY name ASC
SELECT DISTINCT owners.first_name AS name FROM owners LEFT JOIN dogs ON owners.first_name = dogs.name WHERE dogs.name IS NULL UNION SELECT DISTINCT professionals.first_name AS name FROM professionals LEFT JOIN dogs ON professionals.first_name = dogs.name WHERE dogs.name IS NULL ORDER BY name ASC
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT owners.owner_id, owners.first_name, owners.last_name FROM dogs JOIN owners ON dogs.owner_id = owners.owner_id GROUP BY owners.owner_id ORDER BY COUNT(dogs.dog_id) DESC LIMIT 1;
SELECT owner_id, first_name, last_name FROM Owners WHERE owner_id = ( SELECT owner_id FROM Dogs GROUP BY owner_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT professional_id, role_code, first_name FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) >= 2 ) ORDER BY professional_id;
SELECT professional_id, role_code, first_name FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) >= 2 ) ORDER BY professional_id;
SELECT breed_name, COUNT(*) AS dog_count FROM Dogs JOIN Breeds ON Dogs.breed_code = Breeds.breed_code GROUP BY breed_name ORDER BY dog_count DESC LIMIT 1;
SELECT breed_name, COUNT(*) AS num_dogs FROM Dogs JOIN Breeds ON Dogs.breed_code = Breeds.breed_code GROUP BY breed_name ORDER BY num_dogs DESC LIMIT 1;
SELECT o.owner_id, o.last_name, SUM(t.cost_of_treatment) AS total_paid FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id ORDER BY total_paid DESC LIMIT 1;
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1;
SELECT treatment_type_description, SUM(cost_of_treatment) AS total_cost FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code GROUP BY Treatments.treatment_type_code ORDER BY total_cost ASC LIMIT 1;
SELECT treatment_type_description FROM Treatment_Types WHERE treatment_type_code = ( SELECT treatment_type_code FROM Treatments GROUP BY treatment_type_code ORDER BY SUM(cost_of_treatment) ASC LIMIT 1 )
SELECT o.owner_id, o.zip_code, SUM(t.cost_of_treatment) as total_cost FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id ORDER BY total_cost DESC LIMIT 1;
SELECT o.owner_id, o.zip_code, SUM(t.cost_of_treatment) as total_spent FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id ORDER BY total_spent DESC LIMIT 1;
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2 ) ORDER BY professional_id
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2 )
SELECT first_name, last_name FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments WHERE cost_of_treatment < ( SELECT AVG(cost_of_treatment) FROM Treatments ) ) ORDER BY last_name ASC
SELECT Professionals.first_name, Professionals.last_name FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id WHERE Treatments.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)
SELECT date_of_treatment, first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT date_of_treatment, first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id ORDER BY date_of_treatment DESC
SELECT Treatments.cost_of_treatment, Treatment_Types.treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT cost_of_treatment, treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT o.first_name, o.last_name, s.size_description FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Sizes s ON d.size_code = s.size_code ORDER BY o.last_name
SELECT o.first_name, o.last_name, s.size_description FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Sizes s ON d.size_code = s.size_code ORDER BY o.last_name
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY o.first_name
SELECT Dogs.name, Treatments.date_of_treatment FROM Dogs JOIN Breeds ON Dogs.breed_code = Breeds.breed_code JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Breeds.breed_name = ( SELECT Breeds.breed_name FROM Dogs JOIN Breeds ON Dogs.breed_code = Breeds.breed_code GROUP BY Breeds.breed_name ORDER BY COUNT(*) ASC LIMIT 1 ) ORDER BY Treatments.date_of_treatment ASC
SELECT Dogs.name, Treatments.date_of_treatment FROM Dogs JOIN Breeds ON Dogs.breed_code = Breeds.breed_code JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Breeds.breed_name = (SELECT breed_name FROM Breeds ORDER BY breed_name LIMIT 1) ORDER BY Treatments.date_of_treatment ASC
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia'
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia' ORDER BY o.first_name
SELECT Dogs.date_arrived, Dogs.date_departed FROM Dogs INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.date_departed IS NOT NULL
SELECT Dogs.date_arrived, Dogs.date_departed FROM Dogs INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Treatments.date_of_treatment IS NOT NULL
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE d.date_of_birth = (SELECT MIN(date_of_birth) FROM Dogs)
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE d.date_of_birth = (SELECT MIN(date_of_birth) FROM Dogs) ORDER BY d.date_of_birth ASC LIMIT 1;
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT date_arrived, date_departed FROM Dogs
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1;
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM Owners o LEFT JOIN Dogs d ON o.owner_id = d.owner_id WHERE d.owner_id IS NULL
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN (SELECT DISTINCT owner_id FROM Dogs WHERE date_departed IS NULL)
SELECT COUNT(*) FROM Professionals WHERE professional_id NOT IN (SELECT DISTINCT professional_id FROM Treatments)
SELECT COUNT(*) FROM Professionals WHERE professional_id NOT IN (SELECT DISTINCT professional_id FROM Treatments)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1' ORDER BY name ASC
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT AVG(age) FROM Dogs
SELECT AVG(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT charge_type, charge_amount FROM Charges
SELECT charge_type, charge_amount FROM Charges
SELECT MAX(charge_amount) FROM Charges
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1;
SELECT email_address, home_phone, cell_number FROM Professionals
SELECT email_address, home_phone, cell_number FROM Professionals
SELECT Breeds.breed_name, Sizes.size_description FROM Breeds, Sizes
SELECT DISTINCT Dogs.breed_code, Sizes.size_code FROM Dogs JOIN Sizes ON Dogs.size_code = Sizes.size_code ORDER BY Dogs.breed_code, Sizes.size_code
SELECT Professionals.first_name, Treatment_Types.treatment_type_description FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT Professionals.first_name, Treatment_Types.treatment_type_description FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name, Net_Worth_Millions FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != "France" ORDER BY Name ASC
SELECT Name FROM singer WHERE Citizenship != 'French'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT name FROM singer WHERE birth_year = 1948 OR birth_year = 1949
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1;
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1;
SELECT DISTINCT Citizenship, COUNT(*) AS Num_Singers FROM singer GROUP BY Citizenship ORDER BY Num_Singers DESC
SELECT citizenship, COUNT(*) FROM singer GROUP BY citizenship ORDER BY COUNT(*) DESC
SELECT Citizenship, COUNT(*) as Count FROM singer GROUP BY Citizenship ORDER BY Count DESC LIMIT 1
SELECT citizenship, COUNT(*) as count FROM singer GROUP BY citizenship ORDER BY count DESC LIMIT 1
SELECT citizenship, MAX(net_worth_millions) FROM singer GROUP BY citizenship
SELECT citizenship, MAX(net_worth_millions) FROM singer GROUP BY citizenship
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT song.title, singer.name FROM song JOIN singer ON song.singer_id = singer.singer_id
SELECT DISTINCT singer.Name FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID WHERE song.Sales > 300000 ORDER BY singer.Name ASC
SELECT Name FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM song WHERE Sales > 300000)
SELECT singer.name FROM singer JOIN song ON singer.singer_id = song.singer_id GROUP BY singer.singer_id HAVING COUNT(song.song_id) > 1 ORDER BY singer.name ASC
SELECT singer.name FROM singer JOIN song ON singer.singer_id = song.singer_id GROUP BY singer.singer_id HAVING COUNT(song.song_id) > 1 ORDER BY singer.name ASC
SELECT singer.Name, SUM(song.Sales) as Total_Sales FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Name ORDER BY Total_Sales DESC
SELECT singer.Name, SUM(song.Sales) AS Total_Sales FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Name ORDER BY Total_Sales DESC
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT DISTINCT s1.citizenship FROM singer s1 JOIN song ON s1.singer_id = song.singer_id JOIN singer s2 ON s2.singer_id = song.singer_id WHERE s1.birth_year < 1945 AND s2.birth_year > 1955
SELECT DISTINCT s1.citizenship FROM singer s1 JOIN singer s2 ON s1.citizenship = s2.citizenship WHERE s1.birth_year < 1945 AND s2.birth_year > 1955
SELECT COUNT(*) FROM Other_Available_Features
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = (SELECT feature_type_code FROM Other_Available_Features WHERE feature_name = 'AirCon')
ERROR
SELECT property_name FROM Properties WHERE (property_type_code = 'APT' OR property_type_code = 'HSE') AND room_count > 1
