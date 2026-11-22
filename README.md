# boot-social-network

A small Spring Boot demo "social network" with a status feed.

Updated stack: Spring Boot 4.2, Spring MVC, Thymeleaf, Spring Data JPA (Hibernate 7),
Spring Security 7 and PostgreSQL.

## Requirements

- **JDK 21 or newer** (Spring Boot 4.2 supports Java 17-27; this project targets Java 21).
  Check with `java -version`.
- **Maven 3.6.3+** - check with `mvn -version`.
- **PostgreSQL** (any recent version).

## 1. Create the database

The tables are created/updated by Hibernate on startup (`spring.jpa.hibernate.ddl-auto=update`),
but the database itself must exist:

```bash
createdb socialnetwork
# or
psql -c 'CREATE DATABASE socialnetwork;'
```

Don't have PostgreSQL installed? A Docker container works too:

```bash
docker run --name social-postgres \
  -e POSTGRES_DB=socialnetwork \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  -d postgres:18
```

## 2. Configure the connection

`src/main/resources/application.properties` reads these environment variables (defaults in
parentheses):

| Variable | Default |
| --- | --- |
| `POSTGRES_HOST` | `localhost` |
| `POSTGRES_PORT` | `5432` |
| `POSTGRES_DB` | `socialnetwork` |
| `POSTGRES_USER` | `postgres` |
| `POSTGRES_PASSWORD` | `postgres` |

With the defaults above you don't need to set anything. Otherwise, for example:

```bash
export POSTGRES_PASSWORD=secret
```

## 3. Run it

```bash
mvn spring-boot:run
```

Then open <http://localhost:8080>.

Alternatively, build a runnable JAR and start it directly:

```bash
mvn clean package
java -jar target/social-network-0.1.jar
```

## 4. Log in

Only `/`, `/login`, `/error` and the static files under `/css`, `/js`, `/fonts` and `/img`
are public. Every other page requires authentication.

There is no custom user store, so Spring Boot's default user applies:

- username: `user`
- password: generated at startup and printed in the console
  (`Using generated security password: ...`). Set `SPRING_SECURITY_USER_PASSWORD` to choose
  your own password before starting the app.

## Pages

| URL | Description |
| --- | --- |
| `/` | Home, shows the latest status update |
| `/viewstatus?p=1` | Paged list of status updates (10 per page) |
| `/addstatus` | Create a status update |
| `/editstatus?id=1` | Edit a status update |
| `/deletestatus?id=1` | Delete a status update |
| `/about` | About page (requires login) |
| `/login` | Login form |

## Tests

```bash
mvn test
```

The tests use an in-memory H2 database in PostgreSQL compatibility mode
(`src/test/resources/application-test.properties`), so no running PostgreSQL is required.

## Project layout

- `src/main/java` - application code
- `src/main/resources/templates` - Thymeleaf templates (`fragments/layout.html` holds the page layout)
- `src/main/resources/static` - Bootstrap, CSS, JS and fonts
- `src/main/resources/application.properties` - PostgreSQL and JPA configuration

## Troubleshooting

- **`Connection refused`** - PostgreSQL is not running or `POSTGRES_HOST`/`POSTGRES_PORT` are wrong.
- **`password authentication failed`** - set `POSTGRES_PASSWORD` (and `POSTGRES_USER`) to match
  your database.
- **`Unsupported class file major version`** - you are on an old JDK; use Java 21 or newer.
- **`mvn: command not found`** - Maven is not installed (see Requirements).
