SELECT COUNT(*) FROM singer
SELECT COUNT(Singer_ID) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'French'
SELECT Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)
SELECT Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT singer.Country, COUNT(singer.Singer_ID) AS num_singers FROM singer GROUP BY singer.Country ORDER BY num_singers DESC
SELECT Country, COUNT(*) FROM singer GROUP BY Country ORDER BY COUNT(*) DESC
SELECT singer.Song_Name FROM singer WHERE singer.Age > (SELECT AVG(Age) FROM singer)
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT MAX(Capacity), AVG(Capacity) FROM stadium
SELECT AVG(Capacity), MAX(Capacity) FROM stadium
SELECT Name, Capacity FROM stadium WHERE Highest = (SELECT MAX(Average) FROM stadium)
SELECT Name, Capacity FROM stadium WHERE Highest = (SELECT MAX(Average) FROM stadium)
SELECT COUNT(*) FROM concert WHERE Year = '2014' OR Year = '2015'
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT stadium.Name, COUNT(concert.concert_ID) AS num_concerts FROM stadium LEFT JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID GROUP BY stadium.Name ORDER BY num_concerts DESC
SELECT stadium.Name, COUNT(concert.concert_ID) AS num_concerts FROM stadium LEFT JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID GROUP BY stadium.Name
SELECT stadium.Name, stadium.Capacity, COUNT(concert.concert_ID) AS num_concerts FROM concert JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID WHERE concert.Year >= '2014' GROUP BY stadium.Stadium_ID ORDER BY num_concerts DESC LIMIT 1
SELECT stadium.Name, stadium.Capacity FROM stadium JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID WHERE concert.Year > '2013' GROUP BY stadium.Stadium_ID ORDER BY COUNT(concert.concert_ID) DESC LIMIT 1;
SELECT Year, COUNT(*) as num_concerts FROM concert GROUP BY Year ORDER BY num_concerts DESC LIMIT 1;
SELECT Year, COUNT(*) as num_concerts FROM concert GROUP BY Year ORDER BY num_concerts DESC LIMIT 1;
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT DISTINCT s1.Country FROM singer s1, singer s2 WHERE s1.Age > 40 AND s2.Age < 30 AND s1.Country = s2.Country ORDER BY s1.Country ASC
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014') ORDER BY Capacity DESC
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT concert_Name, Theme, COUNT(Singer_ID) AS num_singers FROM concert LEFT JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY concert.concert_ID ORDER BY num_singers DESC
SELECT concert_Name, Theme, COUNT(Singer_ID) as num_singers FROM concert JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY concert.concert_ID ORDER BY num_singers DESC
SELECT singer.Name, COUNT(singer_in_concert.concert_ID) AS num_concerts FROM singer LEFT JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID GROUP BY singer.Name ORDER BY num_concerts DESC
SELECT singer.Name, COUNT(singer_in_concert.concert_ID) AS num_concerts FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID GROUP BY singer.Name ORDER BY num_concerts DESC
SELECT singer.Name FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID JOIN concert ON concert.concert_ID = singer_in_concert.concert_ID WHERE concert.Year = '2014'
SELECT singer.Name FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID JOIN concert ON concert.concert_ID = singer_in_concert.concert_ID WHERE concert.Year = '2014'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT DISTINCT stadium.Name, stadium.Location FROM concert JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID WHERE concert.Year = '2014' AND stadium.Stadium_ID IN ( SELECT concert.Stadium_ID FROM concert WHERE concert.Year = '2015' ) ORDER BY stadium.Name
SELECT stadium.Name, stadium.Location FROM stadium INNER JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID WHERE concert.Year = '2014' AND stadium.Stadium_ID IN (SELECT concert.Stadium_ID FROM concert WHERE concert.Year = '2015') ORDER BY stadium.Name
SELECT COUNT(*) FROM concert c JOIN stadium s ON c.Stadium_ID = s.Stadium_ID WHERE s.Capacity = (SELECT MAX(Capacity) FROM stadium)
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age ASC LIMIT 1
SELECT MIN(weight) FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) AS max_weight FROM Pets GROUP BY PetType
SELECT COUNT(*) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Age > 20
SELECT COUNT(*) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20
SELECT COUNT(*) FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Pets.PetType = 'dog' AND Student.Sex = 'F'
SELECT COUNT(*) FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Pets.PetType = 'dog' AND Student.Sex = 'F'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT Student.Fname FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType IN ('cat', 'dog') ORDER BY Student.Fname ASC
SELECT Student.Fname FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' OR Pets.PetType = 'dog'
SELECT Student.Fname FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' AND Student.StuID IN ( SELECT Has_Pet.StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'dog' ) ORDER BY Student.Fname
SELECT DISTINCT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' AND s.StuID IN ( SELECT s.StuID FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog' ) ORDER BY s.Fname ASC
SELECT Student.Major, Student.Age FROM Student LEFT JOIN Has_Pet ON Student.StuID = Has_Pet.StuID LEFT JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType != 'cat' OR Pets.PetType IS NULL
SELECT Student.Major, Student.Age FROM Student WHERE Student.StuID NOT IN ( SELECT Has_Pet.StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' ) ORDER BY Student.Major
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT Student.Fname, Student.Age FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'dog' AND Student.StuID NOT IN (SELECT Student.StuID FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat') ORDER BY Student.Age ASC LIMIT 1
SELECT Student.Fname FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'dog' AND Student.StuID NOT IN ( SELECT Student.StuID FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' ) ORDER BY Student.LName ASC
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1 ORDER BY weight DESC
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetType, AVG(pet_age) AS avg_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType
SELECT PetType, AVG(pet_age) AS avg_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType ORDER BY avg_age DESC
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT Student.Fname, Student.Age FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID
SELECT Student.Fname, Student.Age FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID
SELECT PetID FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.LName = 'Smith'
SELECT PetID FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE LName = 'Smith'
SELECT Has_Pet.StuID, COUNT(Has_Pet.PetID) AS num_pets FROM Has_Pet GROUP BY Has_Pet.StuID
SELECT StuID, COUNT(PetID) AS num_pets FROM Has_Pet GROUP BY StuID
SELECT Student.Fname, Student.Sex FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID HAVING COUNT(Has_Pet.PetID) > 1 ORDER BY Student.Fname ASC LIMIT 1
SELECT Student.Fname, Student.Sex FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID HAVING COUNT(Has_Pet.PetID) > 1 ORDER BY Student.Fname ASC
SELECT s.LName FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' AND p.pet_age = 3 ORDER BY s.LName ASC LIMIT 1
SELECT s.LName FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' AND p.pet_age = 3 ORDER BY s.LName DESC LIMIT 1
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT COUNT(*) FROM continents
SELECT COUNT(*) FROM continents
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) AS num_countries FROM continents JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId ORDER BY num_countries DESC
ERROR
SELECT COUNT(*) FROM countries
SELECT COUNT(*) FROM countries
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.ModelId) AS NumModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id ORDER BY NumModels DESC
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.ModelId) AS NumModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id ORDER BY NumModels DESC
SELECT Model, Horsepower FROM model_list JOIN cars_data ON model_list.ModelId = cars_data.Id ORDER BY Horsepower ASC LIMIT 1
SELECT car_names.Model FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id ORDER BY CAST(cars_data.Horsepower AS INTEGER) LIMIT 1
SELECT car_names.Model FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT Model FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE Weight < (SELECT AVG(Weight) FROM cars_data)
ERROR
ERROR
SELECT car_makers.Maker, cars_data.Year FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Year = (SELECT MIN(Year) FROM cars_data) ORDER BY cars_data.Year ASC LIMIT 10;
SELECT car_makers.Maker, cars_data.Year FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id ORDER BY cars_data.Year ASC LIMIT 1
ERROR
SELECT DISTINCT car_names.Model FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year > 1980 ORDER BY car_names.Model ASC
SELECT continents.Continent, COUNT(DISTINCT car_makers.Id) AS MakerCount FROM continents JOIN countries ON continents.ContId = countries.Continent JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY continents.Continent ORDER BY MakerCount DESC
SELECT continents.Continent, COUNT(car_makers.Id) AS NumCarMakers FROM continents JOIN countries ON continents.ContId = countries.Continent JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY continents.Continent ORDER BY NumCarMakers DESC
SELECT countries.CountryName, COUNT(car_makers.Id) AS num_makers FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryName ORDER BY num_makers DESC LIMIT 1;
SELECT countries.CountryName, COUNT(car_makers.Id) AS num_makers FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryName ORDER BY num_makers DESC LIMIT 1;
SELECT car_makers.FullName, COUNT(model_list.ModelId) AS ModelCount FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id ORDER BY ModelCount DESC
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.Model) AS NumModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id ORDER BY NumModels DESC
SELECT cars_data.Accelerate FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'amc' AND model_list.Model = 'hornet sportabout (sw)'
SELECT Accelerate FROM cars_data WHERE Id = ( SELECT MakeId FROM car_names WHERE Model = 'hornet sportabout (sw)' AND Make = 'amc' )
SELECT COUNT(*) FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'france')
SELECT COUNT(DISTINCT car_makers.Id) FROM car_makers JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'France'
SELECT COUNT(DISTINCT car_names.Model) FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'usa'
SELECT COUNT(*) FROM car_names JOIN car_makers ON car_names.MakeId = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'United States'
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT MIN(Weight) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 8 AND cars_data.Year = 1974
SELECT MIN(Weight) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE Cylinders = 8 AND Year = 1974
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT DISTINCT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country ORDER BY countries.CountryName ASC
SELECT DISTINCT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country ORDER BY countries.CountryName ASC
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year ORDER BY Year
SELECT Year, AVG(Weight), AVG(Year) FROM cars_data GROUP BY Year
SELECT countries.CountryName, COUNT(DISTINCT car_makers.Maker) AS num_manufacturers FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.Model = car_names.Model WHERE countries.Continent = 'Europe' GROUP BY countries.CountryName HAVING num_manufacturers >= 3 ORDER BY num_manufacturers DESC
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName HAVING COUNT(DISTINCT cm.Maker) >= 3 AND c.Continent = 'Europe' ORDER BY c.CountryName ASC
SELECT MAX(cars_data.Horsepower), car_makers.Maker FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders = 3 GROUP BY car_makers.Maker ORDER BY MAX(cars_data.Horsepower) DESC LIMIT 1
SELECT car_makers.Maker, MAX(cars_data.Horsepower) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders = 3 GROUP BY car_makers.Maker ORDER BY MAX(cars_data.Horsepower) DESC LIMIT 1;
SELECT car_names.Model, cars_data.MPG FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id ORDER BY cars_data.MPG DESC LIMIT 1;
SELECT Model, MPG FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id ORDER BY MPG DESC LIMIT 1
SELECT AVG(Horsepower) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE Year < 1980
SELECT AVG(Horsepower) FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Model LIKE '%198%' AND cars_data.Year < 1980
SELECT AVG(Edispl) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'volvo'
SELECT AVG(Edispl) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'Volvo'
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders ORDER BY MAX(Accelerate) DESC
SELECT Model, COUNT(*) AS NumCars FROM car_names GROUP BY Model ORDER BY NumCars DESC LIMIT 1;
SELECT Model, COUNT(DISTINCT MakeId) AS NumVersions FROM car_names GROUP BY Model ORDER BY NumVersions DESC LIMIT 1;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT SUM(Weight) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.FullName = 'American Motor Company'
SELECT COUNT(*) FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'American Motor Company'
SELECT car_makers.Id, car_makers.FullName FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id HAVING COUNT(model_list.Model) > 3 ORDER BY car_makers.FullName ASC
SELECT car_makers.Id, car_makers.Maker FROM car_makers INNER JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id HAVING COUNT(model_list.Model) > 3 ORDER BY car_makers.Id ASC
SELECT DISTINCT model_list.Model FROM car_names JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE (car_makers.FullName = 'General Motors' OR cars_data.Weight > 3500) ORDER BY model_list.Model ASC
SELECT car_names.Model FROM car_names JOIN car_makers ON car_names.MakeId = car_makers.Id JOIN model_list ON car_names.Model = model_list.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE car_makers.Maker = 'General Motors' OR cars_data.Weight > 3500 ORDER BY car_names.Model ASC
SELECT Year FROM cars_data WHERE Weight >= 3000 AND Weight <= 4000 GROUP BY Year ORDER BY Year ASC
SELECT DISTINCT cd.Year FROM cars_data cd WHERE cd.Weight < 4000 AND cd.Year IN ( SELECT cd2.Year FROM cars_data cd2 WHERE cd2.Weight > 3000 ) ORDER BY cd.Year ASC
SELECT cars_data.Horsepower FROM cars_data ORDER BY cars_data.Accelerate DESC LIMIT 1
SELECT cars_data.Horsepower FROM cars_data ORDER BY cars_data.Accelerate DESC LIMIT 1
SELECT MIN(Accelerate), Cylinders FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'volvo') GROUP BY Cylinders ORDER BY Accelerate LIMIT 1
SELECT MIN(Accelerate), Cylinders FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'volvo' GROUP BY Cylinders ORDER BY Accelerate LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data))
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data))
SELECT COUNT(DISTINCT Country) FROM car_makers GROUP BY Country HAVING COUNT(DISTINCT Maker) > 2
SELECT COUNT(DISTINCT Country) FROM car_makers GROUP BY Country HAVING COUNT(DISTINCT Maker) > 2
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT car_names.Model, cars_data.Horsepower FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Cylinders = 4 ORDER BY cars_data.Horsepower DESC LIMIT 1
SELECT car_names.Model, cars_data.Horsepower FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Cylinders = 4 ORDER BY cars_data.Horsepower DESC LIMIT 1
SELECT car_names.MakeId, car_makers.Maker FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders <= 3 AND cars_data.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) ORDER BY cars_data.Horsepower DESC
SELECT car_names.MakeId, car_makers.Maker FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders < 4 AND cars_data.Horsepower > (SELECT MIN(Horsepower) FROM cars_data)
SELECT MAX(MPG) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 8 AND cars_data.Year < 1980
SELECT MAX(MPG) FROM cars_data WHERE (Cylinders = 8 OR Year < 1980)
SELECT car_names.Model FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Weight < 3500 AND car_makers.Maker != 'Ford Motor Company' ORDER BY cars_data.Weight ASC
SELECT car_names.Model FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Weight < 3500 AND car_makers.Maker != 'Ford Motor Company' ORDER BY cars_data.Weight ASC
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT DISTINCT Country FROM car_makers) ORDER BY CountryName ASC
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT DISTINCT Country FROM car_makers) ORDER BY CountryName ASC
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id, car_makers.Maker HAVING COUNT(DISTINCT model_list.Model) >= 2 AND COUNT(DISTINCT car_makers.Id) > 3 ORDER BY car_makers.Id ASC
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.Model = car_names.Model WHERE car_names.MakeId IN (SELECT MakeId FROM car_names GROUP BY MakeId HAVING COUNT(DISTINCT Model) >= 2) GROUP BY car_makers.Id HAVING COUNT(DISTINCT car_names.MakeId) > 3 ORDER BY car_makers.Id ASC
SELECT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country JOIN model_list ON car_makers.Id = model_list.Maker WHERE car_makers.Maker IN ('fiat') GROUP BY countries.CountryId HAVING COUNT(DISTINCT car_makers.Id) > 3
ERROR
SELECT Country FROM airlines WHERE Airline = "JetBlue Airways"
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = "JetBlue Airways"
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM flights
SELECT COUNT(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportName = 'Alton';
SELECT City, Country FROM airports WHERE AirportName = 'Alton';
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG';
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports AS source ON flights.SourceAirport = source.AirportCode JOIN airports AS dest ON flights.DestAirport = dest.AirportCode WHERE source.City = 'Aberdeen' AND dest.City = 'Ashley'
SELECT COUNT(*) FROM flights WHERE SourceAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') AND DestAirport = (SELECT AirportCode FROM airports WHERE City = 'Ashley')
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'Jetblue Airways'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'
ERROR
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode JOIN airlines ON flights.Airline = airlines.uid WHERE airports.AirportCode = 'AHD' AND airlines.Airline = 'United Airlines'
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') AND SourceAirport = 'AHD'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'
SELECT airports.City, COUNT(*) AS num_arrivals FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY airports.City ORDER BY num_arrivals DESC LIMIT 1;
SELECT airports.City, COUNT(*) AS num_destinations FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY airports.City ORDER BY num_destinations DESC LIMIT 1;
SELECT SourceAirport, COUNT(*) AS num_flights FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode GROUP BY SourceAirport ORDER BY num_flights DESC LIMIT 1;
SELECT SourceAirport, COUNT(*) AS num_flights FROM flights GROUP BY SourceAirport ORDER BY num_flights DESC LIMIT 1;
SELECT SourceAirport, COUNT(*) AS num_flights FROM flights GROUP BY SourceAirport ORDER BY num_flights DESC LIMIT 1;
SELECT SourceAirport, COUNT(*) AS num_flights FROM flights GROUP BY SourceAirport ORDER BY num_flights DESC LIMIT 1;
SELECT SourceAirport, COUNT(*) AS num_flights FROM flights GROUP BY SourceAirport ORDER BY num_flights ASC LIMIT 1;
SELECT SourceAirport, COUNT(*) as num_flights FROM flights GROUP BY SourceAirport ORDER BY num_flights ASC LIMIT 1;
SELECT airlines.Airline, COUNT(*) AS num_flights FROM flights JOIN airlines ON flights.Airline = airlines.uid GROUP BY airlines.Airline ORDER BY num_flights DESC LIMIT 1;
SELECT Airline, COUNT(*) AS num_flights FROM flights GROUP BY Airline ORDER BY num_flights DESC LIMIT 1
SELECT Abbreviation, Country FROM airlines WHERE uid = ( SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Abbreviation, Country FROM airlines WHERE uid = ( SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'AHD'
ERROR
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.DestAirport = 'AHD'
SELECT Airline, Abbreviation FROM airlines WHERE uid IN ( SELECT Airline FROM flights WHERE DestAirport = 'AHD' ) ORDER BY Airline ASC
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'APG' AND flights.DestAirport = 'CVO' INTERSECT SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'CVO' AND flights.DestAirport = 'APG' ORDER BY airlines.Airline ASC
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport IN ('APG', 'CVO') AND flights.DestAirport IN ('APG', 'CVO') GROUP BY airlines.Airline HAVING COUNT(DISTINCT flights.SourceAirport) = 2 AND COUNT(DISTINCT flights.DestAirport) = 2
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'CVO' AND flights.Airline NOT IN ( SELECT airlines.uid FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'APG' ) ORDER BY airlines.Airline ASC
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'CVO' AND airlines.Airline NOT IN (SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'APG') ORDER BY airlines.Airline ASC
SELECT airlines.Airline, COUNT(*) as num_flights FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.Airline HAVING num_flights >= 10 ORDER BY num_flights DESC
SELECT airlines.Airline, COUNT(*) as num_flights FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.Airline HAVING num_flights >= 10 ORDER BY num_flights DESC
ERROR
ERROR
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = "United Airlines"
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines'
SELECT FlightNo FROM flights WHERE SourceAirport = "APG"
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = "APG"
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = "Aberdeen"
SELECT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = "Aberdeen"
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen' OR airports.City = 'Abilene'
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen' OR City = 'Abilene')
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights) ORDER BY AirportName ASC
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights) ORDER BY AirportName ASC
SELECT COUNT(Employee_ID) FROM employee
SELECT COUNT(Employee_ID) FROM employee
SELECT Name, Age FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(Employee_ID) FROM employee GROUP BY City
SELECT City, COUNT(Employee_ID) FROM employee GROUP BY City
SELECT e.City FROM employee e WHERE e.Age < 30 GROUP BY e.City HAVING COUNT(e.Employee_ID) > 1
SELECT e.City FROM employee e WHERE e.Age < 30 GROUP BY e.City HAVING COUNT(e.Employee_ID) > 1
SELECT Location, COUNT(*) AS Num_Shops FROM shop GROUP BY Location ORDER BY Num_Shops DESC
SELECT Location, COUNT(*) FROM shop GROUP BY Location ORDER BY COUNT(*) DESC
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT MAX(Number_products) FROM shop)
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Employee_ID, COUNT(*) as awards FROM evaluation GROUP BY Employee_ID ORDER BY awards DESC LIMIT 1;
SELECT employee.Name FROM employee JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID GROUP BY employee.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT employee.Name, evaluation.Bonus FROM evaluation JOIN employee ON evaluation.Employee_ID = employee.Employee_ID ORDER BY evaluation.Bonus DESC LIMIT 1
SELECT employee.Name FROM employee JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID ORDER BY evaluation.Bonus DESC LIMIT 1
SELECT employee.Name FROM employee WHERE employee.Employee_ID NOT IN ( SELECT evaluation.Employee_ID FROM evaluation ) ORDER BY employee.Name
SELECT employee.Name FROM employee LEFT JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID WHERE evaluation.Employee_ID IS NULL
SELECT shop.Name, COUNT(hiring.Employee_ID) AS num_employees FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Shop_ID ORDER BY num_employees DESC LIMIT 1;
SELECT shop.Name FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Shop_ID ORDER BY COUNT(hiring.Employee_ID) DESC LIMIT 1;
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT shop.Name, COUNT(hiring.Employee_ID) AS num_employees FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Name
SELECT shop.Name, COUNT(hiring.Employee_ID) AS num_employees FROM shop LEFT JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Shop_ID ORDER BY num_employees DESC
SELECT SUM(Bonus) FROM evaluation
SELECT SUM(Bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT DISTINCT s.District FROM shop s WHERE s.Number_products < 3000 AND s.District IN ( SELECT s2.District FROM shop s2 WHERE s2.Number_products > 10000 ) ORDER BY s.District ASC
SELECT s.District FROM shop s WHERE s.Number_products < 3000 AND s.District IN ( SELECT s2.District FROM shop s2 WHERE s2.Number_products > 10000 ) GROUP BY s.District
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(*) FROM Documents
SELECT COUNT(*) FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Documents.Document_Name, Documents.Template_ID FROM Documents WHERE Documents.Document_Description LIKE '%w%'
SELECT Document_Name, Document_ID, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Documents.Document_ID, Documents.Template_ID, Documents.Document_Description FROM Documents WHERE Documents.Document_Name = "Robbin CV"
SELECT Documents.Document_ID, Documents.Template_ID, Documents.Document_Description FROM Documents WHERE Documents.Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(DISTINCT Templates.Template_ID) FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID
SELECT COUNT(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'PPT'
SELECT COUNT(*) FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE t.Template_Type_Code = 'PPT'
SELECT Templates.Template_ID, COUNT(Documents.Document_ID) AS num_documents FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID
SELECT Documents.Template_ID, COUNT(*) AS Usage_Count FROM Documents GROUP BY Documents.Template_ID
SELECT Templates.Template_ID, Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID ORDER BY COUNT(Documents.Document_ID) DESC LIMIT 1;
SELECT Templates.Template_ID, Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID ORDER BY COUNT(Documents.Document_ID) DESC LIMIT 1;
SELECT Templates.Template_ID FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID HAVING COUNT(DISTINCT Documents.Document_ID) > 1 ORDER BY Templates.Template_ID ASC
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(DISTINCT Document_ID) > 1
SELECT Templates.Template_ID FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Document_ID IS NULL;
SELECT Templates.Template_ID FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Document_ID IS NULL
SELECT COUNT(*) FROM Templates
SELECT COUNT(Template_ID) FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT'
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Templates.Template_Type_Code, COUNT(*) AS Num_Templates FROM Templates GROUP BY Templates.Template_Type_Code
SELECT Template_Type_Code, COUNT(*) AS Num_Templates FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code, COUNT(*) AS num_templates FROM Templates GROUP BY Template_Type_Code ORDER BY num_templates DESC LIMIT 1;
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Template_Type_Code, COUNT(*) as num_templates FROM Templates GROUP BY Template_Type_Code HAVING num_templates < 3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT Templates.Version_Number, Templates.Template_Type_Code FROM Templates ORDER BY Templates.Version_Number ASC LIMIT 1;
SELECT Templates.Version_Number, Templates.Template_Type_Code FROM Templates WHERE Templates.Version_Number = (SELECT MIN(Version_Number) FROM Templates)
SELECT Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Document_Name = "Data base"
SELECT Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Document_Name = 'Data base'
SELECT Documents.Document_Name FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'BK' ORDER BY Documents.Document_Name ASC
SELECT Documents.Document_Name FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'BK'
SELECT Templates.Template_Type_Code, COUNT(Documents.Document_ID) AS Num_Documents FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code
SELECT Templates.Template_Type_Code, COUNT(DISTINCT Documents.Document_ID) AS Num_Documents FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code
SELECT Templates.Template_Type_Code, COUNT(Documents.Document_ID) AS num_docs FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code ORDER BY num_docs DESC LIMIT 1;
SELECT Templates.Template_Type_Code, COUNT(*) AS count FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code ORDER BY count DESC LIMIT 1;
SELECT DISTINCT Templates.Template_Type_Code FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Document_ID IS NULL;
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT DISTINCT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID) ORDER BY Template_Type_Code ASC
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = "AD"
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID
SELECT Templates.Template_ID FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = "Presentation"
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Presentation')
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Summer Show'
SELECT COUNT(*) FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Summer Show'
SELECT Paragraph_ID, Document_ID, Paragraph_Text FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea %'
SELECT Paragraph_ID, Document_ID, Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea %'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = "Customer reviews"
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Customer reviews'
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS num_paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID
SELECT Document_ID, COUNT(*) AS Num_Paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Num_Paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Num_Paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Num_Paragraphs DESC
SELECT Document_ID, COUNT(*) as num_paragraphs FROM Paragraphs GROUP BY Document_ID HAVING num_paragraphs >= 2 ORDER BY Document_ID ASC
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS num_paragraphs FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY num_paragraphs DESC LIMIT 1;
SELECT Documents.Document_ID, Documents.Document_Name FROM Documents JOIN ( SELECT Document_ID, COUNT(*) AS num_paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY num_paragraphs DESC LIMIT 1 ) AS max_paragraphs ON Documents.Document_ID = max_paragraphs.Document_ID
SELECT Document_ID, COUNT(*) as num_paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY num_paragraphs ASC LIMIT 1;
SELECT Document_ID, COUNT(*) AS num_paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY num_paragraphs ASC LIMIT 1;
SELECT Document_ID, COUNT(*) as num_paragraphs FROM Paragraphs GROUP BY Document_ID HAVING num_paragraphs BETWEEN 1 AND 2 ORDER BY num_paragraphs DESC;
SELECT Document_ID, COUNT(*) as num_paragraphs FROM Paragraphs GROUP BY Document_ID HAVING num_paragraphs BETWEEN 1 AND 2
SELECT p.Document_ID FROM Paragraphs p WHERE p.Paragraph_Text IN ('Brazil', 'Ireland') GROUP BY p.Document_ID HAVING COUNT(DISTINCT p.Paragraph_Text) = 2
SELECT DISTINCT Documents.Document_ID FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID WHERE Paragraphs.Paragraph_Text LIKE '%Brazil%' AND Paragraphs.Paragraph_Text LIKE '%Ireland%' ORDER BY Documents.Document_ID
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age, Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age IN ('32', '33')
SELECT Name FROM teacher WHERE Age IN ('32', '33')
SELECT Hometown FROM teacher ORDER BY Age LIMIT 1
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT Hometown, COUNT(*) as Num_Teachers FROM teacher GROUP BY Hometown
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC
SELECT Hometown, COUNT(*) as count FROM teacher GROUP BY Hometown ORDER BY count DESC LIMIT 1
SELECT Hometown, COUNT(*) as count FROM teacher GROUP BY Hometown ORDER BY count DESC LIMIT 1
SELECT DISTINCT t1.Hometown FROM teacher t1 JOIN teacher t2 ON t1.Hometown = t2.Hometown AND t1.Teacher_ID <> t2.Teacher_ID ORDER BY t1.Hometown
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name ASC
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name ASC
SELECT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID WHERE course.Course = 'math'
SELECT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID WHERE course.Course = 'Math' ORDER BY teacher.Name ASC
SELECT teacher.Name, COUNT(course_arrange.Course_ID) AS num_courses FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Name ORDER BY num_courses DESC
SELECT teacher.Name, COUNT(course_arrange.Course_ID) AS num_courses FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Name ORDER BY num_courses DESC;
SELECT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID HAVING COUNT(DISTINCT course_arrange.Course_ID) >= 2 ORDER BY teacher.Name ASC
SELECT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID HAVING COUNT(DISTINCT course_arrange.Course_ID) >= 2 ORDER BY teacher.Name ASC
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT DISTINCT teacher.Name FROM teacher LEFT JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID WHERE course_arrange.Course_ID IS NULL
SELECT COUNT(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < '2009'
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > '2010')
SELECT visitor.ID, visitor.Name, visitor.Age FROM visitor INNER JOIN visit ON visitor.ID = visit.visitor_ID WHERE visit.Num_of_Ticket > 1 GROUP BY visitor.ID
SELECT visitor.ID, visitor.Name, visitor.Level_of_membership FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID GROUP BY visitor.ID ORDER BY SUM(visit.Total_spent) DESC LIMIT 1
SELECT Museum_ID, Name FROM museum WHERE Museum_ID = ( SELECT Museum_ID FROM visit GROUP BY Museum_ID ORDER BY SUM(Num_of_Ticket) DESC LIMIT 1 )
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT visitor.Name, visitor.Age, visit.Num_of_Ticket FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID ORDER BY visit.Num_of_Ticket DESC LIMIT 1
SELECT AVG(Num_of_Ticket), MAX(Num_of_Ticket) FROM visit
SELECT SUM(Total_spent) FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE Level_of_membership = 1
SELECT v1.visitor_ID, vi.Name FROM visit v1 JOIN visit v2 ON v1.visitor_ID = v2.visitor_ID JOIN museum m1 ON v1.Museum_ID = m1.Museum_ID JOIN museum m2 ON v2.Museum_ID = m2.Museum_ID JOIN visitor vi ON v1.visitor_ID = vi.ID WHERE m1.Open_Year < '2009' AND m2.Open_Year > '2011' GROUP BY v1.visitor_ID ORDER BY vi.Name ASC
SELECT COUNT(DISTINCT visitor_ID) FROM visit WHERE Museum_ID NOT IN (SELECT Museum_ID FROM museum WHERE Open_Year > '2010')
SELECT COUNT(*) FROM museum WHERE Open_Year > '2013' OR Open_Year < '2008'
SELECT COUNT(DISTINCT player_id) FROM players
SELECT COUNT(*) FROM players
SELECT COUNT(*) FROM matches
SELECT COUNT(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT AVG(loser_age), AVG(winner_age) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT tourney_name, COUNT(*) as num_matches FROM matches GROUP BY tourney_name HAVING num_matches > 10 ORDER BY num_matches DESC LIMIT 1;
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10 ORDER BY COUNT(*) DESC
SELECT DISTINCT winner_name FROM matches WHERE year = 2013 AND winner_name IN ( SELECT winner_name FROM matches WHERE year = 2016 ) ORDER BY winner_name ASC
SELECT winner_name FROM matches WHERE year = 2013 AND winner_name IN (SELECT winner_name FROM matches WHERE year = 2016) ORDER BY winner_name
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016
SELECT winner_name, winner_ioc FROM matches WHERE tourney_name = 'WTA Championships' AND winner_name IN (SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open') ORDER BY winner_name ASC
SELECT players.first_name, players.country_code FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'WTA Championships' AND matches.tourney_id LIKE '%AUS%' INTERSECT SELECT players.first_name, players.country_code FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'Australian Open'
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
ERROR
ERROR
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date;
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT players.first_name, players.country_code FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id ORDER BY SUM(rankings.tours) DESC LIMIT 1;
SELECT players.first_name, players.country_code FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id ORDER BY SUM(rankings.tours) DESC LIMIT 1;
SELECT year, COUNT(*) as num_matches FROM matches GROUP BY year ORDER BY num_matches DESC LIMIT 1
SELECT year, COUNT(*) as num_matches FROM matches GROUP BY year ORDER BY num_matches DESC LIMIT 1;
SELECT winner_name, winner_rank_points FROM matches GROUP BY winner_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT winner_name, MAX(winner_rank_points) FROM matches GROUP BY winner_name ORDER BY MAX(winner_rank_points) DESC LIMIT 1;
SELECT winner_name FROM matches JOIN rankings ON matches.winner_id = rankings.player_id WHERE tourney_name = 'Australian Open' AND winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches JOIN rankings ON matches.winner_id = rankings.player_id WHERE tourney_name = 'Australian Open')
SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1;
SELECT loser_name, winner_name FROM matches ORDER BY minutes DESC LIMIT 1;
SELECT winner_name, loser_name, minutes FROM matches ORDER BY minutes DESC LIMIT 1;
SELECT players.first_name, AVG(rankings.ranking) AS avg_ranking FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id ORDER BY avg_ranking ASC
SELECT players.first_name, AVG(rankings.ranking) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name ORDER BY AVG(rankings.ranking) ASC
SELECT players.first_name, SUM(rankings.ranking_points) AS total_points FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id ORDER BY total_points DESC
SELECT players.first_name, SUM(rankings.ranking_points) as total_ranking_points FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name ORDER BY total_ranking_points DESC
SELECT players.country_code, COUNT(DISTINCT players.player_id) AS num_players FROM players GROUP BY players.country_code ORDER BY num_players DESC
SELECT players.country_code, COUNT(*) AS num_players FROM players GROUP BY players.country_code ORDER BY num_players DESC
SELECT players.country_code, COUNT(players.player_id) AS num_players FROM players GROUP BY players.country_code ORDER BY num_players DESC LIMIT 1;
SELECT country_code, COUNT(*) as num_players FROM players GROUP BY country_code ORDER BY num_players DESC LIMIT 1;
SELECT players.country_code, COUNT(players.player_id) AS num_players FROM players GROUP BY players.country_code HAVING num_players > 50 ORDER BY num_players DESC
SELECT players.country_code, COUNT(players.player_id) AS num_players FROM players GROUP BY players.country_code HAVING num_players > 50 ORDER BY num_players DESC
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date ORDER BY ranking_date ASC
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date ORDER BY ranking_date ASC
SELECT year, COUNT(*) FROM matches GROUP BY year ORDER BY year
SELECT year, COUNT(*) FROM matches GROUP BY year ORDER BY year
SELECT winner_name, winner_rank, winner_age FROM matches ORDER BY winner_age ASC LIMIT 3
SELECT winner_name, winner_rank, winner_age FROM matches ORDER BY winner_age ASC LIMIT 3
SELECT COUNT(DISTINCT winner_name) FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L'
SELECT COUNT(*) FROM matches JOIN players ON matches.winner_id = players.player_id WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships';
SELECT players.first_name, players.country_code, players.birth_date FROM players JOIN matches ON players.player_id = matches.winner_id JOIN rankings ON matches.winner_id = rankings.player_id WHERE rankings.ranking_points = (SELECT MAX(ranking_points) FROM rankings)
SELECT players.first_name, players.country_code, players.birth_date FROM players JOIN matches ON players.player_id = matches.winner_id ORDER BY matches.winner_rank_points DESC LIMIT 1
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT hand, COUNT(DISTINCT player_id) AS num_players FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT name, date, result FROM battle
SELECT MAX(killed), MIN(killed) FROM death
SELECT AVG(injured) FROM death
SELECT d.note, d.killed, d.injured FROM death d JOIN ship s ON d.caused_by_ship_id = s.id WHERE s.tonnage = 't'
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT battle.id, battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.ship_type = 'Brig'
SELECT battle.id, battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle JOIN death ON ship.id = death.caused_by_ship_id GROUP BY battle.id HAVING SUM(death.killed) > 10 ORDER BY SUM(death.killed) DESC
SELECT ship.id, ship.name, SUM(death.injured) AS total_injuries FROM ship JOIN death ON ship.id = death.caused_by_ship_id GROUP BY ship.id ORDER BY total_injuries DESC LIMIT 1;
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225')
SELECT battle.name, battle.date FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.name = 'Lettice' OR ship.name = 'HMS Atalanta' GROUP BY battle.id HAVING COUNT(DISTINCT ship.name) = 2
SELECT battle.name, battle.result, battle.bulgarian_commander FROM battle LEFT JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.id IS NULL AND ship.location = 'English Channel'
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1, line_2 FROM Addresses
SELECT line_1, line_2 FROM Addresses
SELECT COUNT(*) FROM Courses
SELECT COUNT(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = 'Math'
SELECT course_description FROM Courses WHERE course_name LIKE '%math%'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT Departments.department_id, Departments.department_name, COUNT(Degree_Programs.degree_program_id) AS num_degrees FROM Departments JOIN Degree_Programs ON Departments.department_id = Degree_Programs.department_id GROUP BY Departments.department_id ORDER BY num_degrees DESC LIMIT 1;
ERROR
SELECT COUNT(*) FROM Degree_Programs
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs
SELECT COUNT(*) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering')
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering')
SELECT section_name, section_description FROM Sections
SELECT section_name, section_description FROM Sections
SELECT Courses.course_id, Courses.course_name, COUNT(Sections.section_id) AS num_sections FROM Courses LEFT JOIN Sections ON Courses.course_id = Sections.course_id GROUP BY Courses.course_id HAVING num_sections <= 2 ORDER BY num_sections DESC;
SELECT course_id, course_name FROM Courses WHERE course_id IN ( SELECT course_id FROM Sections GROUP BY course_id HAVING COUNT(*) < 2 ) ORDER BY course_id;
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT Semesters.semester_id, Semesters.semester_name, COUNT(Student_Enrolment.student_enrolment_id) AS enrolment_count FROM Semesters JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id GROUP BY Semesters.semester_id ORDER BY enrolment_count DESC LIMIT 1;
SELECT Semesters.semester_id, Semesters.semester_name, COUNT(Student_Enrolment.student_enrolment_id) AS num_students FROM Semesters JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id GROUP BY Semesters.semester_id ORDER BY num_students DESC LIMIT 1;
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2 AND COUNT(DISTINCT se.semester_id) = 1
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2 AND COUNT(DISTINCT se.semester_id) = 1
SELECT Students.first_name, Students.middle_name, Students.last_name FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name LIKE '%Bachelor%'
ERROR
SELECT Degree_Programs.degree_summary_name, COUNT(Student_Enrolment.student_id) AS num_students FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_summary_name ORDER BY num_students DESC LIMIT 1;
SELECT Degree_Programs.degree_summary_name, COUNT(Student_Enrolment.student_id) AS num_students FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_summary_name ORDER BY num_students DESC LIMIT 1;
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_name FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id ORDER BY COUNT(Student_Enrolment.student_id) DESC LIMIT 1;
SELECT degree_program_id, degree_summary_name FROM Degree_Programs WHERE degree_program_id = ( SELECT degree_program_id FROM Student_Enrolment GROUP BY degree_program_id ORDER BY COUNT(student_id) DESC LIMIT 1 )
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(*) AS num_enrollments FROM Student_Enrolment se JOIN Students s ON se.student_id = s.student_id GROUP BY s.student_id ORDER BY num_enrollments DESC LIMIT 1;
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(*) AS num_enrollments FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id ORDER BY num_enrollments DESC LIMIT 1;
SELECT Semesters.semester_name FROM Semesters LEFT JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id WHERE Student_Enrolment.student_enrolment_id IS NULL
SELECT semester_name FROM Semesters WHERE semester_id NOT IN ( SELECT semester_id FROM Student_Enrolment )
SELECT DISTINCT Courses.course_name FROM Courses JOIN Sections ON Courses.course_id = Sections.course_id JOIN Student_Enrolment_Courses ON Sections.section_id = Student_Enrolment_Courses.course_id
SELECT DISTINCT Courses.course_name FROM Courses JOIN Sections ON Courses.course_id = Sections.course_id JOIN Student_Enrolment_Courses ON Sections.section_id = Student_Enrolment_Courses.course_id
SELECT Courses.course_name, COUNT(Student_Enrolment_Courses.student_course_id) AS num_enrollments FROM Courses JOIN Sections ON Courses.course_id = Sections.course_id JOIN Student_Enrolment_Courses ON Sections.section_id = Student_Enrolment_Courses.course_id GROUP BY Courses.course_id ORDER BY num_enrollments DESC LIMIT 1;
SELECT Courses.course_name, COUNT(Student_Enrolment_Courses.student_course_id) AS num_students FROM Courses JOIN Sections ON Courses.course_id = Sections.course_id JOIN Student_Enrolment_Courses ON Sections.section_id = Student_Enrolment_Courses.course_id GROUP BY Courses.course_id ORDER BY num_students DESC LIMIT 1;
SELECT last_name FROM Students JOIN Addresses ON Students.current_address_id = Addresses.address_id WHERE Addresses.state_province_county = 'North Carolina' AND Students.student_id NOT IN ( SELECT student_id FROM Student_Enrolment )
SELECT last_name FROM Students JOIN Addresses ON Students.current_address_id = Addresses.address_id WHERE Addresses.state_province_county = 'North Carolina' AND Students.student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT transcript_id, transcript_date FROM Transcripts WHERE transcript_id IN ( SELECT transcript_id FROM Transcript_Contents GROUP BY transcript_id HAVING COUNT(DISTINCT student_course_id) >= 2 ) ORDER BY transcript_date DESC LIMIT 10;
SELECT transcript_id, transcript_date FROM Transcripts WHERE transcript_id IN ( SELECT transcript_id FROM Transcript_Contents GROUP BY transcript_id HAVING COUNT(DISTINCT student_course_id) >= 2 ) ORDER BY transcript_date DESC LIMIT 1;
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id ORDER BY se.other_details ASC LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students WHERE date_left = (SELECT MIN(date_left) FROM Students)
SELECT s.first_name FROM Students s JOIN Addresses pa ON s.permanent_address_id = pa.address_id JOIN Addresses ca ON s.current_address_id = ca.address_id WHERE pa.line_1 <> ca.line_1 OR pa.line_2 <> ca.line_2 OR pa.line_3 <> ca.line_3 OR pa.city <> ca.city OR pa.zip_postcode <> ca.zip_postcode OR pa.state_province_county <> ca.state_province_county OR pa.country <> ca.country ORDER BY s.first_name ASC
SELECT s.first_name FROM Students s JOIN Addresses pa ON s.permanent_address_id = pa.address_id JOIN Addresses ca ON s.current_address_id = ca.address_id WHERE pa.line_1 != ca.line_1 ORDER BY s.date_first_registered ASC LIMIT 1;
SELECT current_address_id, line_1, line_2, line_3, city, zip_postcode, state_province_county, country FROM Students JOIN Addresses ON Students.current_address_id = Addresses.address_id GROUP BY current_address_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Addresses.address_id, Addresses.line_1, Addresses.line_2 FROM Addresses JOIN Students ON Addresses.address_id = Students.current_address_id OR Addresses.address_id = Students.permanent_address_id GROUP BY Addresses.address_id ORDER BY COUNT(Students.student_id) DESC LIMIT 1;
SELECT AVG(strftime('%s', transcript_date)) AS avg_transcript_date FROM Transcripts
SELECT AVG(transcript_date) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT COUNT(*) FROM Transcripts
SELECT COUNT(*) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1;
SELECT student_course_id, COUNT(transcript_id) AS num_transcripts FROM Transcript_Contents GROUP BY student_course_id ORDER BY num_transcripts DESC LIMIT 1;
SELECT student_course_id, COUNT(DISTINCT transcript_id) AS num_transcripts FROM Transcript_Contents GROUP BY student_course_id ORDER BY num_transcripts DESC LIMIT 1;
SELECT transcript_id, transcript_date FROM Transcripts ORDER BY transcript_id LIMIT 1
ERROR
SELECT Semesters.semester_name FROM Semesters JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name IN ('Bachelor', 'Master') GROUP BY Semesters.semester_name HAVING COUNT(DISTINCT Degree_Programs.degree_summary_name) = 2
SELECT se.semester_id FROM Student_Enrolment se JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name IN ('Masters', 'Bachelors') GROUP BY se.semester_id HAVING COUNT(DISTINCT dp.degree_summary_name) = 2
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT DISTINCT Addresses.line_1, Addresses.line_2, Addresses.line_3, Addresses.city, Addresses.zip_postcode, Addresses.state_province_county, Addresses.country FROM Addresses JOIN Students ON Addresses.address_id = Students.current_address_id OR Addresses.address_id = Students.permanent_address_id
SELECT first_name, middle_name, last_name, cell_mobile_number, email_address, ssn, date_first_registered, date_left, other_student_details FROM Students ORDER BY last_name DESC
SELECT first_name, middle_name, last_name, cell_mobile_number, email_address, ssn, date_first_registered, date_left, other_student_details FROM Students ORDER BY last_name DESC
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students JOIN Addresses ON Students.permanent_address_id = Addresses.address_id WHERE Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582' ORDER BY first_name ASC
SELECT first_name FROM Students JOIN Addresses ON Students.permanent_address_id = Addresses.address_id WHERE Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582' ORDER BY first_name ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones"
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = "Joseph Kuhr"
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Cartoon.Title, Cartoon.Directed_by, Cartoon.Original_air_date FROM Cartoon ORDER BY Cartoon.Original_air_date
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti"
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT TV_Channel.Country, COUNT(TV_Channel.id) AS num_channels FROM TV_Channel GROUP BY TV_Channel.Country ORDER BY num_channels DESC LIMIT 1;
SELECT TV_Channel.Country, COUNT(TV_Channel.id) AS num_channels FROM TV_Channel GROUP BY TV_Channel.Country ORDER BY num_channels DESC LIMIT 1;
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel;
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio"
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = "Sky Radio"
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT TV_Channel.Language, COUNT(*) AS num_channels FROM TV_Channel GROUP BY TV_Channel.Language ORDER BY num_channels ASC LIMIT 1;
SELECT TV_Channel.Language, COUNT(*) AS num_channels FROM TV_Channel GROUP BY TV_Channel.Language ORDER BY num_channels ASC LIMIT 1;
SELECT TV_Channel.Language, COUNT(TV_Channel.id) AS num_channels FROM TV_Channel GROUP BY TV_Channel.Language ORDER BY num_channels DESC
SELECT Language, COUNT(*) AS Num_Channels FROM TV_Channel GROUP BY Language ORDER BY Num_Channels DESC
SELECT TV_Channel.series_name FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Title = "The Rise of the Blue Beetle!"
SELECT TV_Channel.series_name FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Title = "The Rise of the Blue Beetle"
SELECT Cartoon.Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = "Sky Radio"
SELECT Cartoon.Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = "Sky Radio"
SELECT Episode FROM TV_series ORDER BY Rating DESC
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(Share), MAX(Share) FROM TV_series
SELECT MAX(Share), MIN(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT TV_Channel.series_name, TV_series.Channel FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_series.Episode = "A Love of a Lifetime"
SELECT series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE Episode = "A Love of a Lifetime"
SELECT TV_series.Episode FROM TV_series JOIN TV_Channel ON TV_series.Channel = TV_Channel.id WHERE TV_Channel.series_name = "Sky Radio"
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name = "Sky Radio")
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Directed_by, COUNT(id) FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT TV_Channel.Package_Option, TV_Channel.series_name FROM TV_Channel WHERE TV_Channel.Hight_definition_TV = 'Yes'
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes'
SELECT DISTINCT TV_Channel.Country FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Written_by = 'Todd Casey'
SELECT DISTINCT TV_Channel.Country FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Written_by = 'Todd Casey'
SELECT DISTINCT TV_Channel.Country FROM TV_Channel LEFT JOIN Cartoon ON Cartoon.Channel = TV_Channel.id AND Cartoon.Written_by = 'Todd Casey' WHERE Cartoon.id IS NULL
SELECT DISTINCT TV_Channel.Country FROM TV_Channel INNER JOIN Cartoon ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Written_by != 'Todd Casey'
SELECT TV_Channel.series_name, TV_Channel.Country FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Directed_by = 'Ben Jones' AND Cartoon.Directed_by = 'Michael Chang' GROUP BY TV_Channel.series_name, TV_Channel.Country
SELECT TV_Channel.series_name, TV_Channel.Country FROM TV_Channel JOIN Cartoon ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Directed_by = 'Ben Jones' OR Cartoon.Directed_by = 'Michael Chang' GROUP BY TV_Channel.series_name, TV_Channel.Country
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT TV_Channel.id FROM TV_Channel WHERE Country IN ( SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2 ) ORDER BY TV_Channel.id
SELECT id FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon GROUP BY Channel HAVING COUNT(DISTINCT Channel) > 2) ORDER BY id
SELECT TV_Channel.id FROM TV_Channel WHERE TV_Channel.id NOT IN ( SELECT Cartoon.Channel FROM Cartoon WHERE Cartoon.Directed_by = 'Ben Jones' ) ORDER BY TV_Channel.id ASC
SELECT TV_Channel.id FROM TV_Channel LEFT JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Directed_by != 'Ben Jones' OR Cartoon.Directed_by IS NULL GROUP BY TV_Channel.id
SELECT TV_Channel.Package_Option FROM TV_Channel WHERE TV_Channel.id NOT IN ( SELECT Cartoon.Channel FROM Cartoon WHERE Cartoon.Directed_by = 'Ben Jones' )
SELECT DISTINCT TV_Channel.Package_Option FROM TV_Channel LEFT JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Directed_by != 'Ben Jones' OR Cartoon.Directed_by IS NULL
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1;
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID
SELECT Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID
SELECT people.Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID WHERE poker_player.Earnings > 300000 ORDER BY poker_player.Earnings DESC
SELECT people.Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID WHERE poker_player.Earnings > 300000 ORDER BY poker_player.Earnings DESC
SELECT people.Name, poker_player.Final_Table_Made FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID ORDER BY poker_player.Final_Table_Made ASC
SELECT people.Name, poker_player.Final_Table_Made FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID ORDER BY poker_player.Final_Table_Made ASC
SELECT p.Birth_Date FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings ASC LIMIT 1;
SELECT p.Birth_Date FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings ASC LIMIT 1;
SELECT pp.Money_Rank FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE p.Height = (SELECT MAX(Height) FROM people)
SELECT pp.Money_Rank FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID ORDER BY p.Height DESC LIMIT 1
SELECT AVG(Earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE Height > 200
SELECT AVG(Earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE Height > 200
SELECT p.Name, pp.Earnings FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings DESC
SELECT p.Name, pp.Earnings FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings DESC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC
SELECT Nationality, COUNT(*) as count FROM people GROUP BY Nationality ORDER BY count DESC LIMIT 1;
SELECT Nationality, COUNT(*) as count FROM people GROUP BY Nationality ORDER BY count DESC LIMIT 1;
SELECT DISTINCT p1.Nationality FROM people p1 INNER JOIN people p2 ON p1.Nationality = p2.Nationality AND p1.People_ID <> p2.People_ID ORDER BY p1.Nationality
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2 ORDER BY Nationality ASC
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
SELECT MAX(created) FROM VOTES WHERE state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES
SELECT CONTESTANTS.contestant_number, CONTESTANTS.contestant_name FROM CONTESTANTS INNER JOIN VOTES ON CONTESTANTS.contestant_number = VOTES.contestant_number GROUP BY CONTESTANTS.contestant_number, CONTESTANTS.contestant_name HAVING COUNT(*) >= 2 ORDER BY COUNT(*) DESC;
SELECT contestant_number, contestant_name FROM CONTESTANTS WHERE contestant_number IN ( SELECT contestant_number FROM VOTES GROUP BY contestant_number HAVING COUNT(*) = ( SELECT MIN(vote_count) FROM ( SELECT contestant_number, COUNT(*) as vote_count FROM VOTES GROUP BY contestant_number ) ) )
SELECT COUNT(*) FROM VOTES WHERE state = 'NY' OR state = 'CA'
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
SELECT state, COUNT(*) AS num_votes FROM VOTES GROUP BY state ORDER BY num_votes DESC LIMIT 1;
SELECT created, state, phone_number FROM VOTES JOIN CONTESTANTS ON VOTES.contestant_number = CONTESTANTS.contestant_number WHERE CONTESTANTS.contestant_name = 'Tabatha Gehling'
SELECT DISTINCT a.area_code FROM VOTES v1 JOIN VOTES v2 ON v1.phone_number = v2.phone_number AND v1.state = v2.state JOIN CONTESTANTS c1 ON v1.contestant_number = c1.contestant_number AND c1.contestant_name = 'Tabatha Gehling' JOIN CONTESTANTS c2 ON v2.contestant_number = c2.contestant_number AND c2.contestant_name = 'Kelly Clauss' JOIN AREA_CODE_STATE a ON v1.state = a.state ORDER BY a.area_code ASC
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%' ORDER BY contestant_name ASC
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT COUNT(*) FROM country WHERE GovernmentForm LIKE '%Republic%'
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Caribbean'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT Continent FROM country WHERE Code = 'AIA'
SELECT country.Region FROM city JOIN country ON city.CountryCode = country.Code WHERE city.Name = 'Kabul'
SELECT country.Region FROM city JOIN country ON city.CountryCode = country.Code WHERE city.Name = 'Kabul'
SELECT Language, Percentage FROM countrylanguage WHERE CountryCode = 'ABW' ORDER BY Percentage DESC LIMIT 1;
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' AND IsOfficial = 'T'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT country.Region, country.Population FROM country WHERE country.Name = 'Angola'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND Region = 'Central Africa'
SELECT country.Name FROM country WHERE country.Continent = 'Asia' ORDER BY country.LifeExpectancy ASC LIMIT 1;
SELECT country.Name FROM country WHERE country.Continent = 'Asia' ORDER BY country.LifeExpectancy ASC LIMIT 1;
SELECT SUM(country.Population), MAX(country.GNP) FROM country WHERE country.Continent = 'Asia'
SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT SUM(city.Population) FROM city JOIN country ON city.CountryCode = country.Code WHERE city.District = 'Gelderland'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US Territory'
SELECT AVG(GNP), SUM(Population) FROM country WHERE Continent = 'North America' AND Region = 'Caribbean'
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT country.Name, COUNT(DISTINCT countrylanguage.Language) AS num_languages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Code ORDER BY num_languages DESC LIMIT 1;
SELECT country.Name, COUNT(DISTINCT countrylanguage.Language) AS num_languages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Code ORDER BY num_languages DESC LIMIT 1;
SELECT country.Continent, COUNT(DISTINCT countrylanguage.Language) AS num_languages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Continent ORDER BY num_languages DESC LIMIT 1;
SELECT country.Continent, COUNT(DISTINCT countrylanguage.Language) AS NumLanguages FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode GROUP BY country.Continent ORDER BY NumLanguages DESC LIMIT 1;
SELECT COUNT(DISTINCT cl.CountryCode) FROM countrylanguage cl WHERE cl.Language = 'English' AND cl.CountryCode IN (SELECT cl2.CountryCode FROM countrylanguage cl2 WHERE cl2.Language = 'Dutch')
SELECT COUNT(DISTINCT cl.CountryCode) FROM countrylanguage cl WHERE cl.Language IN ('English', 'Dutch') AND cl.IsOfficial = 'T'
SELECT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T' JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T' ORDER BY c.Name ASC
SELECT c.Name FROM country c INNER JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T' INNER JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T' ORDER BY c.Name ASC
SELECT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T' JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T' ORDER BY c.Name
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' AND EXISTS (SELECT 1 FROM countrylanguage WHERE CountryCode = c.Code AND Language = 'French' AND IsOfficial = 'T') ORDER BY c.Name ASC
SELECT COUNT(DISTINCT country.Continent) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Chinese'
SELECT COUNT(DISTINCT country.Continent) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T'
SELECT DISTINCT country.Region FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language IN ('English', 'Dutch') ORDER BY country.Region ASC
SELECT DISTINCT country.Region FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language IN ('Dutch', 'English') ORDER BY country.Region
SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE (countrylanguage.Language = 'English' OR countrylanguage.Language = 'Dutch') AND countrylanguage.IsOfficial = 'T' ORDER BY country.Name ASC
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T' UNION SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch' AND IsOfficial = 'T') ORDER BY Name ASC
SELECT Language, Percentage FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE Continent = 'Asia' AND IsOfficial = 'T' ORDER BY Percentage DESC LIMIT 1;
SELECT Language, COUNT(DISTINCT CountryCode) AS NumCountries FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND IsOfficial = 'T' GROUP BY Language ORDER BY NumCountries DESC LIMIT 1;
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm LIKE '%Republic%' GROUP BY cl.Language HAVING COUNT(DISTINCT c.Code) = 1
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm = 'Republic' AND cl.Percentage = 100 GROUP BY cl.Language HAVING COUNT(*) = 1
SELECT city.Name, city.Population FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T' ORDER BY city.Population DESC LIMIT 1;
SELECT city.Name, city.Population FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T' ORDER BY city.Population DESC LIMIT 1;
SELECT country.Name, country.Population, country.LifeExpectancy FROM country WHERE country.Continent = 'Asia' ORDER BY country.SurfaceArea DESC LIMIT 1
SELECT country.Name, country.Population, country.LifeExpectancy FROM country WHERE country.Continent = 'Asia' ORDER BY country.SurfaceArea DESC LIMIT 1;
SELECT AVG(LifeExpectancy) FROM country WHERE Code IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'F' )
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT SUM(country.Population) FROM country WHERE country.Code NOT IN (SELECT countrylanguage.CountryCode FROM countrylanguage WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T')
SELECT SUM(city.Population) FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE countrylanguage.Language != 'English'
SELECT Language FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE IsOfficial = 'T' AND country.HeadOfState = 'Beatrix'
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.HeadOfState = 'Beatrix' AND cl.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN (SELECT Code FROM country WHERE IndepYear < 1930)
SELECT COUNT(DISTINCT Language) FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE country.IndepYear < 1930 AND IsOfficial = 'T'
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name, SurfaceArea FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT c.Name, c.Population FROM country c WHERE c.Continent = 'Africa' AND c.Population < (SELECT MIN(c2.Population) FROM country c2 WHERE c2.Continent = 'Asia')
SELECT c.Name, c.Population FROM country c WHERE c.Continent = 'Africa' AND c.Population < (SELECT MIN(c2.Population) FROM country c2 WHERE c2.Continent = 'Asia') ORDER BY c.Population ASC
SELECT country.Name, country.Population FROM country WHERE country.Continent = 'Asia' AND country.Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa') ORDER BY country.Population DESC LIMIT 10;
SELECT c.Name, c.Population FROM country c WHERE c.Continent = 'Asia' AND c.Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa') ORDER BY c.Population DESC LIMIT 10;
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language <> 'English'
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm != 'Republic'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T') AND GovernmentForm NOT LIKE '%Republic%' ORDER BY Code ASC
SELECT city.Name, country.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Europe' AND countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F'
SELECT city.Name FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Europe' AND countrylanguage.Language = 'English' AND countrylanguage.IsOfficial != 'T' ORDER BY city.Name ASC
SELECT DISTINCT city.Name FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T' ORDER BY city.Name ASC
SELECT city.Name FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T' ORDER BY city.Name ASC
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population LIMIT 1;
SELECT country.Name, country.IndepYear, country.SurfaceArea FROM country ORDER BY country.Population ASC LIMIT 1;
SELECT country.Name, country.Population, country.HeadOfState FROM country WHERE country.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT Name, Population, HeadOfState FROM country WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT country.Name, COUNT(countrylanguage.Language) AS num_languages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Code HAVING COUNT(countrylanguage.Language) >= 3 ORDER BY num_languages DESC
SELECT country.Name, COUNT(countrylanguage.Language) AS NumLanguages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Name HAVING COUNT(countrylanguage.Language) > 2 ORDER BY NumLanguages DESC;
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District ORDER BY COUNT(*) DESC
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District ORDER BY COUNT(*) DESC
SELECT country.GovernmentForm, SUM(country.Population) as TotalPopulation FROM country WHERE country.GovernmentForm IN ( SELECT country.GovernmentForm FROM country WHERE country.LifeExpectancy > 72 GROUP BY country.GovernmentForm ) GROUP BY country.GovernmentForm
SELECT country.GovernmentForm, SUM(country.Population) FROM country WHERE country.LifeExpectancy > 72 GROUP BY country.GovernmentForm
SELECT country.Continent, AVG(country.LifeExpectancy), SUM(country.Population) FROM country WHERE country.LifeExpectancy < 72 GROUP BY country.Continent
SELECT country.Continent, SUM(country.Population) AS TotalPopulation, AVG(country.LifeExpectancy) AS AverageLifeExpectancy FROM country WHERE country.Continent IN (SELECT country.Continent FROM country GROUP BY country.Continent HAVING AVG(country.LifeExpectancy) < 72) GROUP BY country.Continent ORDER BY TotalPopulation DESC
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name, Population FROM country ORDER BY Population ASC LIMIT 3
SELECT Name, Population FROM country ORDER BY Population ASC LIMIT 3
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000;
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT Name, Population FROM city WHERE Population BETWEEN 160000 AND 900000 ORDER BY Population DESC
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000 ORDER BY Population DESC
SELECT Language, COUNT(DISTINCT CountryCode) AS NumCountries FROM countrylanguage GROUP BY Language ORDER BY NumCountries DESC LIMIT 1;
SELECT Language, COUNT(DISTINCT CountryCode) AS NumCountries FROM countrylanguage GROUP BY Language ORDER BY NumCountries DESC LIMIT 1;
SELECT cl.CountryCode, cl.Language, MAX(cl.Percentage) AS MaxPercentage FROM countrylanguage cl GROUP BY cl.CountryCode
SELECT cl.CountryCode, cl.Language FROM countrylanguage cl WHERE cl.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = cl.CountryCode) ORDER BY cl.CountryCode ASC
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish')
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T'
SELECT cl.CountryCode, MAX(cl.Percentage) AS MaxPercentage FROM countrylanguage cl WHERE cl.Language = 'Spanish' GROUP BY cl.CountryCode ORDER BY MaxPercentage DESC LIMIT 1
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T' ORDER BY Percentage DESC
SELECT COUNT(*) FROM conductor
SELECT COUNT(*) FROM conductor
SELECT Name, Age FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor WHERE Nationality != "USA"
SELECT Name FROM conductor WHERE Nationality != "USA" ORDER BY Name ASC
SELECT orchestra.Record_Company FROM orchestra ORDER BY orchestra.Year_of_Founded DESC
SELECT Record_Company, Year_of_Founded FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(Attendance) FROM show
SELECT AVG(Attendance) FROM show
SELECT MAX(Attendance), MIN(Attendance) FROM show JOIN performance ON show.Performance_ID = performance.Performance_ID WHERE performance.Type != "Live final"
SELECT MAX(Attendance), MIN(Attendance) FROM show JOIN performance ON show.Performance_ID = performance.Performance_ID WHERE performance.Type != "Live final"
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name, Year_of_Work FROM conductor ORDER BY Year_of_Work DESC
SELECT Name, Age, Nationality, Year_of_Work FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1;
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT conductor.Name, orchestra.Orchestra FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID
SELECT conductor.Name, orchestra.Orchestra FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID
SELECT conductor.Name FROM conductor INNER JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID HAVING COUNT(DISTINCT orchestra.Orchestra_ID) > 1 ORDER BY conductor.Name ASC
SELECT conductor.Name FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID HAVING COUNT(DISTINCT orchestra.Orchestra_ID) > 1 ORDER BY conductor.Name ASC
SELECT conductor.Name, COUNT(DISTINCT orchestra.Orchestra_ID) AS num_orchestras FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID ORDER BY num_orchestras DESC LIMIT 1;
SELECT conductor.Name, COUNT(DISTINCT orchestra.Orchestra_ID) AS num_orchestras FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID ORDER BY num_orchestras DESC LIMIT 1;
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008
SELECT conductor.Name FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID WHERE orchestra.Year_of_Founded > 2008
SELECT Record_Company, COUNT(DISTINCT Orchestra_ID) FROM orchestra GROUP BY Record_Company
SELECT record_company, COUNT(DISTINCT orchestra_id) FROM orchestra GROUP BY record_company ORDER BY COUNT(DISTINCT orchestra_id) DESC
SELECT Major_Record_Format, COUNT(*) as count FROM orchestra GROUP BY Major_Record_Format ORDER BY count ASC
SELECT Major_Record_Format, COUNT(*) as Frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY Frequency DESC
SELECT orchestra.Record_Company, COUNT(DISTINCT orchestra.Orchestra_ID) AS num_orchestras FROM orchestra GROUP BY orchestra.Record_Company ORDER BY num_orchestras DESC LIMIT 1;
SELECT orchestra.Record_Company, COUNT(DISTINCT orchestra.Orchestra_ID) AS num_orchestras FROM orchestra GROUP BY orchestra.Record_Company ORDER BY num_orchestras DESC LIMIT 1;
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance) ORDER BY Orchestra ASC
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance) ORDER BY Orchestra
SELECT orchestra.Record_Company FROM orchestra WHERE orchestra.Year_of_Founded < 2003 INTERSECT SELECT orchestra.Record_Company FROM orchestra WHERE orchestra.Year_of_Founded > 2003 ORDER BY orchestra.Record_Company ASC
SELECT o.Record_Company FROM orchestra o JOIN performance p ON o.Orchestra_ID = p.Orchestra_ID JOIN show s ON p.Performance_ID = s.Performance_ID WHERE o.Year_of_Founded < 2003 AND o.Record_Company IN ( SELECT o2.Record_Company FROM orchestra o2 JOIN performance p2 ON o2.Orchestra_ID = p2.Orchestra_ID JOIN show s2 ON p2.Performance_ID = s2.Performance_ID WHERE o2.Year_of_Founded > 2003 ) GROUP BY o.Record_Company ORDER BY o.Record_Company ASC
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format = "CD" OR Major_Record_Format = "DVD"
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN ( SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(*) > 1 ) ORDER BY Year_of_Founded
SELECT orchestra.Year_of_Founded FROM orchestra JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID GROUP BY orchestra.Orchestra_ID HAVING COUNT(DISTINCT performance.Performance_ID) > 1 ORDER BY orchestra.Year_of_Founded ASC
SELECT COUNT(*) FROM Highschooler
SELECT COUNT(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10 ORDER BY name;
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade ORDER BY grade ASC
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade ORDER BY grade
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1;
SELECT grade, COUNT(*) AS num_highschoolers FROM Highschooler GROUP BY grade ORDER BY num_highschoolers DESC LIMIT 1;
ERROR
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4 ORDER BY grade ASC
SELECT student_id, COUNT(friend_id) AS num_friends FROM Friend GROUP BY student_id ORDER BY num_friends DESC
SELECT student_id, COUNT(friend_id) FROM Friend GROUP BY student_id
SELECT Highschooler.name, COUNT(Friend.friend_id) FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY COUNT(Friend.friend_id) DESC
SELECT Highschooler.name, COUNT(Friend.friend_id) FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY COUNT(Friend.friend_id) DESC
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY COUNT(Friend.friend_id) DESC LIMIT 1;
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY COUNT(Friend.friend_id) DESC LIMIT 1;
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID HAVING COUNT(Friend.friend_id) >= 3 ORDER BY Highschooler.name ASC
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID HAVING COUNT(Friend.friend_id) >= 3 ORDER BY Highschooler.name ASC
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.friend_id JOIN Highschooler k ON k.ID = f.student_id WHERE k.name = 'Kyle' ORDER BY h.name ASC
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.friend_id JOIN Highschooler k ON k.ID = f.student_id WHERE k.name = 'Kyle' ORDER BY h.name
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT h.ID FROM Highschooler h WHERE h.ID NOT IN ( SELECT f.student_id FROM Friend f UNION SELECT f.friend_id FROM Friend f ) ORDER BY h.ID
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT Highschooler.name FROM Highschooler WHERE Highschooler.ID NOT IN (SELECT Friend.student_id FROM Friend) ORDER BY Highschooler.name ASC
SELECT h.name FROM Highschooler h WHERE h.ID NOT IN ( SELECT f.student_id FROM Friend f UNION SELECT f.friend_id FROM Friend f ) ORDER BY h.name ASC
ERROR
ERROR
SELECT DISTINCT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id JOIN Likes ON Highschooler.ID = Likes.student_id WHERE Friend.friend_id IS NOT NULL AND Likes.liked_id <> Highschooler.ID ORDER BY Highschooler.name ASC
SELECT DISTINCT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id JOIN Likes l ON h.ID = l.student_id WHERE h.ID IN (SELECT friend_id FROM Friend) AND h.ID IN (SELECT liked_id FROM Likes) ORDER BY h.name ASC
SELECT student_id, COUNT(*) FROM Likes GROUP BY student_id
SELECT student_id, COUNT(*) FROM Likes GROUP BY student_id ORDER BY COUNT(*) DESC
SELECT Highschooler.name, COUNT(Likes.liked_id) AS num_likes FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID
SELECT Highschooler.name, COUNT(Likes.liked_id) AS num_likes FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID ORDER BY num_likes DESC;
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Likes.student_id ORDER BY COUNT(Likes.liked_id) DESC LIMIT 1;
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Likes.student_id ORDER BY COUNT(Likes.liked_id) DESC LIMIT 1;
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID HAVING COUNT(Likes.liked_id) >= 2 ORDER BY Highschooler.name ASC
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Likes.student_id HAVING COUNT(Likes.liked_id) >= 2 ORDER BY Highschooler.name ASC
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id WHERE Highschooler.grade > 5 GROUP BY Highschooler.ID HAVING COUNT(Friend.friend_id) >= 2 ORDER BY Highschooler.name ASC
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id WHERE Highschooler.grade > 5 GROUP BY Highschooler.ID HAVING COUNT(Friend.friend_id) >= 2 ORDER BY Highschooler.name ASC
SELECT COUNT(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT AVG(H.grade) FROM Highschooler H WHERE H.ID IN (SELECT F.student_id FROM Friend F UNION SELECT F.friend_id FROM Friend F)
SELECT AVG(H.grade) FROM Highschooler H WHERE H.ID IN (SELECT F.student_id FROM Friend F)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT DISTINCT o.state FROM Owners o INNER JOIN Professionals p ON o.state = p.state ORDER BY o.state
SELECT DISTINCT Owners.state FROM Owners INNER JOIN Professionals ON Owners.state = Professionals.state ORDER BY Owners.state ASC
SELECT AVG(strftime('%Y', 'now') - strftime('%Y', date_of_birth)) AS avg_age FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id
SELECT AVG(julianday('now') - julianday(date_of_birth)) AS avg_age FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) > 2 ) ORDER BY last_name;
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) > 2) ORDER BY last_name ASC
SELECT d.name FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY d.dog_id HAVING SUM(t.cost_of_treatment) <= 1000
SELECT Dogs.name FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY Dogs.dog_id HAVING SUM(Treatments.cost_of_treatment) <= 1000
SELECT DISTINCT first_name FROM ( SELECT first_name FROM Owners UNION SELECT first_name FROM Professionals ) AS names WHERE names.first_name NOT IN ( SELECT name FROM Dogs ) ORDER BY first_name ASC
SELECT DISTINCT first_name FROM ( SELECT first_name FROM Owners UNION SELECT first_name FROM Professionals ) AS names WHERE names.first_name NOT IN ( SELECT name FROM Dogs ) ORDER BY first_name ASC
SELECT Professionals.professional_id, Professionals.role_code, Professionals.email_address FROM Professionals LEFT JOIN Treatments ON Professionals.professional_id = Treatments.professional_id WHERE Treatments.treatment_id IS NULL
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT o.owner_id, o.first_name, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id ORDER BY COUNT(d.dog_id) DESC LIMIT 1;
SELECT owner_id, first_name, last_name FROM Owners WHERE owner_id = ( SELECT owner_id FROM Dogs GROUP BY owner_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT professional_id, role_code, first_name FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) >= 2 ) ORDER BY professional_id
SELECT professional_id, role_code, first_name FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) >= 2 ) ORDER BY professional_id;
SELECT Breeds.breed_name, COUNT(Dogs.dog_id) AS dog_count FROM Dogs JOIN Breeds ON Dogs.breed_code = Breeds.breed_code GROUP BY Breeds.breed_name ORDER BY dog_count DESC LIMIT 1;
SELECT Breeds.breed_name, COUNT(Dogs.dog_id) AS dog_count FROM Dogs JOIN Breeds ON Dogs.breed_code = Breeds.breed_code GROUP BY Breeds.breed_name ORDER BY dog_count DESC LIMIT 1;
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1;
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1;
SELECT treatment_type_description FROM Treatment_Types WHERE treatment_type_code = ( SELECT treatment_type_code FROM Treatments GROUP BY treatment_type_code ORDER BY SUM(cost_of_treatment) ASC LIMIT 1 )
SELECT Treatment_Types.treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code GROUP BY Treatments.treatment_type_code ORDER BY SUM(Treatments.cost_of_treatment) ASC LIMIT 1;
SELECT d.owner_id, o.zip_code, SUM(t.cost_of_treatment) AS total_cost FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id JOIN Owners o ON d.owner_id = o.owner_id GROUP BY d.owner_id ORDER BY total_cost DESC LIMIT 1;
SELECT d.owner_id, o.zip_code, SUM(t.cost_of_treatment) AS total_spent FROM Treatments t JOIN Dogs d ON t.dog_id = d.dog_id JOIN Owners o ON d.owner_id = o.owner_id GROUP BY d.owner_id ORDER BY total_spent DESC LIMIT 1;
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2 ) ORDER BY professional_id
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2 ) ORDER BY professional_id;
SELECT Professionals.first_name, Professionals.last_name FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id WHERE Treatments.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments) GROUP BY Professionals.professional_id ORDER BY Treatments.cost_of_treatment ASC
SELECT Professionals.first_name, Professionals.last_name FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id WHERE Treatments.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments) GROUP BY Professionals.professional_id
SELECT Treatments.date_of_treatment, Professionals.first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT date_of_treatment, Professionals.first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT Treatments.cost_of_treatment, Treatment_Types.treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT cost_of_treatment, treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT o.first_name, o.last_name, s.size_description FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Sizes s ON d.size_code = s.size_code ORDER BY o.last_name
SELECT o.first_name, o.last_name, d.size_code FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY o.last_name
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id ORDER BY Owners.first_name
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id ORDER BY Owners.first_name
SELECT Dogs.name, Treatments.date_of_treatment FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.breed_code = ( SELECT breed_code FROM Breeds ORDER BY breed_name LIMIT 1 ) ORDER BY Treatments.date_of_treatment ASC
SELECT Dogs.name, Treatments.date_of_treatment FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.breed_code = (SELECT breed_code FROM Breeds ORDER BY breed_name LIMIT 1) ORDER BY Treatments.date_of_treatment DESC
SELECT o.first_name, d.name FROM Dogs d JOIN Owners o ON d.owner_id = o.owner_id WHERE o.state = 'Virginia' ORDER BY o.first_name
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia' ORDER BY o.first_name
SELECT Dogs.date_arrived, Dogs.date_departed FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.date_departed IS NOT NULL
SELECT Dogs.date_arrived, Dogs.date_departed FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Treatments.date_of_treatment IS NOT NULL
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE d.age = (SELECT MIN(age) FROM Dogs) ORDER BY d.date_of_birth DESC LIMIT 1;
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE d.age = (SELECT MIN(age) FROM Dogs)
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT name, date_arrived, date_departed FROM Dogs
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%' ORDER BY last_name ASC
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%' ORDER BY last_name ASC
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1;
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM Owners o LEFT JOIN Dogs d ON o.owner_id = d.owner_id WHERE d.date_departed IS NOT NULL AND d.date_adopted IS NULL
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN (SELECT DISTINCT owner_id FROM Dogs WHERE date_departed IS NULL)
SELECT COUNT(DISTINCT professional_id) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT COUNT(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
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
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT Breeds.breed_name, Sizes.size_description FROM Breeds, Sizes
SELECT DISTINCT Dogs.breed_code, Sizes.size_code FROM Dogs JOIN Sizes ON Dogs.size_code = Sizes.size_code
SELECT Professionals.first_name, Treatment_Types.treatment_type_description FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code ORDER BY Professionals.first_name
SELECT Professionals.first_name, Treatment_Types.treatment_type_description FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code ORDER BY Professionals.first_name
SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name, Net_Worth_Millions FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != "France" ORDER BY Name ASC
SELECT Name FROM singer WHERE Citizenship <> 'French'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1;
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1;
SELECT Citizenship, COUNT(*) as Num_Singers FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC
SELECT Citizenship, COUNT(*) as Count FROM singer GROUP BY Citizenship ORDER BY Count DESC LIMIT 1;
SELECT Citizenship, COUNT(*) AS Count FROM singer GROUP BY Citizenship ORDER BY Count DESC LIMIT 1;
SELECT singer.Citizenship, MAX(singer.Net_Worth_Millions) FROM singer GROUP BY singer.Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT DISTINCT singer.Name FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID WHERE song.Sales > 300000 ORDER BY singer.Name ASC
SELECT Name FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM song WHERE Sales > 300000)
SELECT singer.Name FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Singer_ID HAVING COUNT(song.Song_ID) > 1 ORDER BY singer.Name ASC
SELECT singer.Name FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Singer_ID HAVING COUNT(song.Song_ID) > 1 ORDER BY singer.Name ASC
SELECT singer.Name, SUM(song.Sales) as Total_Sales FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Name ORDER BY Total_Sales DESC
SELECT singer.Name, SUM(song.Sales) AS Total_Sales FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Name ORDER BY Total_Sales DESC
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT DISTINCT s.Citizenship FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID WHERE s.Birth_Year < 1945 AND s.Birth_Year > 1955 ORDER BY s.Citizenship ASC
SELECT DISTINCT s.Citizenship FROM singer s WHERE s.Birth_Year < 1945 AND s.Birth_Year > 1955
SELECT COUNT(*) FROM Other_Available_Features
SELECT feature_type_name FROM Ref_Feature_Types JOIN Other_Available_Features ON Ref_Feature_Types.feature_type_code = Other_Available_Features.feature_type_code WHERE feature_name = 'AirCon'
SELECT property_type_description FROM Ref_Property_Types WHERE property_type_code = 'code'
SELECT property_name FROM Properties WHERE property_type_code IN ('APT', 'HSE') AND room_count > 1
