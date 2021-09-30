/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package javalin.jlink.test;

import io.javalin.Javalin;

public class App {
    public static void main(String[] args) {
        int port = Integer.parseInt(System.getenv("PORT"));

        Javalin app = Javalin.create().start(port);
        app.get("/", ctx -> ctx.result("Hello World"));
    }
}