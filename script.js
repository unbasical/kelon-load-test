// Author: Daniel Seifert

import http from "k6/http";
import {check} from "k6"

export let options = {
    stages: [
        { duration: "30s", target: 4 },
        { duration: "1m30s", target: 10 },
        { duration: "20s", target: 1 },
      ]
  };

export default function(data) {
    // Get all apps
    let res = http.post('http://localhost:8181/v1/data', JSON.stringify({
        input: {
            method: 'GET',
            path: '/api/apps'
        }
    }))
    res.body = JSON.parse(res.body)
    check(res, {
        "Get all apps is status 200": (r) => r.status === 200,
        "Get all apps is allowed": (r) => r.body.result === true,
    })

    // Click single app
    res = http.post('http://localhost:8181/v1/data', JSON.stringify({
        input: {
            method: 'GET',
            path: '/api/apps/5',
        }
    }))
    res.body = JSON.parse(res.body)
    check(res, {
        "Get one app is status 200": (r) => r.status === 200,
        "Get one app is allowed": (r) => r.body.result === true,
    })

    // Update own app
    res = http.post('http://localhost:8181/v1/data', JSON.stringify({
        input: {
            method: 'PUT',
            path: '/api/users/2/apps/20',
            username: 'user-2'
        }
    }))
    res.body = JSON.parse(res.body)
    check(res, {
        "Update own is status 200": (r) => r.status === 200,
        "Update own is allowed": (r) => r.body.result === true,
    })

    // Update app from stranger
    res = http.post('http://localhost:8181/v1/data', JSON.stringify({
        input: {
            method: 'PUT',
            path: '/api/users/2/apps/30',
            username: 'user-2'
        }
    }))
    res.body = JSON.parse(res.body)
    check(res, {
        "Update app from stranger is status 200": (r) => r.status === 200,
        "Update app from stranger is denied": (r) => r.body.result === false,
    })
}