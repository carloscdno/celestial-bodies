-- Looking at the table structures, we can see that there are relationships between the following tables:

-- galaxies and stars (galaxy_id in the galaxy table is referenced by the star_id in the star table)
-- stars and planets (star_id in the stars table is referenced by the star_id in the planets table)
-- planets and planet_types (planet_type_id in the planet_types table is referenced by the planet_type_id in the planets table)
-- planets and moons (planet_id in the planets table is referenced by the planet_id in the moons table)

-- These relationships can be used to join the tables together and perform various queries. 

-- 1. Retrieve all the names of galaxies along with the names of their associated stars

SELECT g.name AS galaxy_name, s.name AS star_name
FROM galaxy g
JOIN star s ON g.galaxy_id = s.galaxy_id;

-- Results:
+-------------+-------------------------+
| galaxy_name |        star_name        |
+-------------+-------------------------+
| milky way   | sun                     |
| milky way   | sirius                  |
| triangulum  | epsilon monocerotis     |
| messier 87  | alpha trianguli         |
| andromeda   | alpha centauri a        |
| whirlpool   | delta canum venaticorum |
+-------------+-------------------------+

-- 2. Get the names of all planets along with their corresponding star names

SELECT p.name AS planet_name, s.name AS star_name
FROM planet p
JOIN star s ON p.star_id = s.star_id;

-- Results:
+-------------+---------------------+
| planet_name |      star_name      |
+-------------+---------------------+
| pluto       | alpha trianguli     |
| earth       | sun                 |
| venus       | sun                 |
| mars        | sun                 |
| jupiter     | alpha centauri a    |
| saturn      | alpha centauri a    |
| uranus      | epsilon monocerotis |
| neptune     | epsilon monocerotis |
| mercury     | sun                 |
| proxima c   | sirius              |
| callisto    | alpha centauri a    |
| triton      | epsilon monocerotis |
+-------------+---------------------+

-- 3. Find the names of all moons and their respective planet names. Sort by planet name.

SELECT m.name AS moon_name, p.name AS planet_name
FROM moon m
JOIN planet p ON m.planet_id = p.planet_id
ORDER BY planet_name;

-- Results:

+-----------------+-------------+
|    moon_name    | planet_name |
+-----------------+-------------+
| luna            | earth       |
| ganymede        | jupiter     |
| callisto        | jupiter     |
| phobos          | mars        |
| deimos          | mars        |
| kepler-22b moon | mercury     |
| triton          | neptune     |
| charon          | neptune     |
| nereid          | neptune     |
| kepler-62b moon | proxima c   |
| titan           | saturn      |
| rhea            | saturn      |
| lapetus         | saturn      |
| mimas           | saturn      |
| enceladus       | saturn      |
| proxima moon    | triton      |
| umbriel         | uranus      |
| titania         | uranus      |
| oberon          | uranus      |
| miranda         | uranus      |
+-----------------+-------------+
