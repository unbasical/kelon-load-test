import {Client} from 'pg'
import {from, range, Observable, of} from 'rxjs'
import {flatMap, tap, map, mergeMap, mapTo, last} from 'rxjs/operators'

// Adjust amount of created entities
const AMOUNT_OF_DEVELOPERS = 1000
const APPS_PER_DEVELOPER = 10
const AMOUNT_OF_USERS = 1000

// Execute main on start
main()
.catch(err => console.error(err))
.then(() => console.log("Done"))

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

    // Create Admin
    await of(1).pipe(
        flatMap(i => insertUser(i, 'ADMIN', client))
    ).toPromise()

    // Create Developers
    let from = 2
    let amount = AMOUNT_OF_DEVELOPERS
    await range(from, amount).pipe(
        flatMap(i => insertUser(i, 'DEVELOPER', client)),
        flatMap(userId => range(userId * APPS_PER_DEVELOPER, APPS_PER_DEVELOPER).pipe(
            flatMap(appId => insertApp(appId, userId, client))
        )),
        last(),
    ).toPromise()

    // Create Users
    from = amount + 2
    amount = AMOUNT_OF_USERS
    await range(from, amount).pipe(
        tap(i => console.log(`Create USER ${i}`)),
        flatMap(i => insertUser(i, 'USER', client)),
        last(),
    ).toPromise()

    // End
    await client.end()
}

const insertUser = (i: number, role: string, client: Client): Observable<number> => 
    of({
        id: i,
        name: `user-${i}`, 
        email: `user${i}@company.com`,
        password: `user-${i}`,
        role: role
    }).pipe(
        flatMap(u => from(client.query(
            `INSERT INTO appstore.users 
                (id, create_date, update_date, name, email, password, role) 
                VALUES (${u.id}, now(), now(), '${u.name}', '${u.email}', '${u.password}', '${u.role}')`
        ))),
        tap(() => console.log(`Create ${role} ${i}`)),
        map(() => i)
    )

    const insertApp = (appId: number, userId: number, client: Client): Observable<number> => 
    of({
        id: appId,
        title: `This is App ${userId}`,
        description: `This is App ${userId} which is owned by user ${userId}`, 
        views: Math.floor(Math.random() * 1000000),
        user_id: userId
    }).pipe(
        flatMap(a => from(client.query(
            `INSERT INTO appstore.app 
                (id, create_date, update_date, title, description, views, user_id) 
                VALUES (${a.id}, now(), now(), '${a.title}', '${a.description}', '${a.views}', '${a.user_id}')`
        ))),
        tap(() => console.log(`Create app ${appId} Owner ${userId}`)),
        map(() => userId)
    )