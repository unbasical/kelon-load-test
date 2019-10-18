import http from "k6/http";

export function setup() {
    // 2. setup code
}

export default function(data) {
    let response = http.get("https://test.loadimpact.com");
}

export function teardown(data) {
    // 4. teardown code
}