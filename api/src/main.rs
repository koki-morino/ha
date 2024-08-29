use axum::{routing::get, Json, Router};
use serde::Serialize;

// TODO: Think of interfaces.

#[tokio::main]
async fn main() {
    let app = Router::new().route("/", get(root));

    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    axum::serve(listener, app).await.unwrap();
}

async fn root() -> Json<Response> {
    Json(Response {
        message: String::from("Hello, world!"),
    })
}

#[derive(Serialize)]
struct Response {
    message: String,
}
