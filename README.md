# Running the frontend

The frontend pages in `templates` are served by the Spring Boot application in
`backend`; this folder is not a separate Maven or Node.js project. Running
`mvn spring-boot:run` directly from this folder will fail because it has no
`pom.xml`.

From PowerShell in this folder, start the application with:

```powershell
.\run-frontend.cmd
```

This launcher runs the backend Maven wrapper while pointing Maven at the
backend's `pom.xml`. It opens [http://localhost:8083](http://localhost:8083)
if the application is already running; otherwise it starts the application.
