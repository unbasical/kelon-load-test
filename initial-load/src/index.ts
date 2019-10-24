import {Client} from 'pg'
import {from, range, Observable, of} from 'rxjs'
import {flatMap, tap, map} from 'rxjs/operators'

async function main() {
    // Create client
    const client = new Client({
        host: "localhost",
        database: "appstore",
        port: 5432,
        user: "admin",
        password: "SuperSecure",
    })
    
    // Connect and truncate database
    await client.connect()
    await client.query(`
        TRUNCATE appstore.app CASCADE;
        TRUNCATE appstore.app_comments CASCADE;
        TRUNCATE appstore.app_ratings CASCADE;
        TRUNCATE appstore.app_screenshots CASCADE;
        TRUNCATE appstore.app_tags CASCADE;
        TRUNCATE appstore.comment CASCADE;
        TRUNCATE appstore.feedback CASCADE;
        TRUNCATE appstore.logo CASCADE;
        TRUNCATE appstore.rating CASCADE;
        TRUNCATE appstore.screenshot CASCADE;
        TRUNCATE appstore.tag CASCADE;
        TRUNCATE appstore.users CASCADE;
    `)

    // Insert data
    await range(1, 100).pipe(
        flatMap(i => insertUser(i, client)),
        tap(i => console.log(i))
    ).toPromise()
    await client.end()
}

main()
.catch(err => console.error(err))
.then(() => console.log("Done"))

const insertUser = (i: number, client: Client): Observable<number> => 
    of({
        id: i,
        name: `user-${i}`, 
        email: `user${i}@company.com`,
        password: `user-${i}`,
        role: 'ADMIN'
    }).pipe(
        flatMap(u => from(client.query(
            `INSERT INTO appstore.users 
                (id, name, email, password, role) 
                VALUES (${u.id}, '${u.name}', '${u.email}', '${u.password}', '${u.role}')`
        ))),
        map(() => i)
    )