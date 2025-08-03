
:bulb: <u>Starts Mailpit in a detached container, maps ports 8025 (web UI) and 1025 (SMTP), and removes the container when stopped:</u>

```bash
docker run -d --rm -p 8025:8025 -p 1025:1025 --name mailpit axllent/mailpit
```

<hr>

:bulb: <u>Opens an interactive shell inside the running PHP container:</u>

```bash
docker compose exec -it php sh 
```

<hr>

:bulb: <u>Creates a new Laravel project in the 'example-app' directory:</u>

```bash
composer create-project laravel/laravel example-app
```

<hr>

:bulb: <u>Starts a temporary Node container with port 5173 exposed and opens an interactive shell:</u>

```bash
docker compose run --rm -it -p 5173:5173 node sh
```

<hr>

:bulb: <u>Starts phpMyAdmin in background on port 8080, connect to a MySQL container named 'db' via 'app_network' Docker network.</u>

```bash
docker run -d --rm --name phpmyadmin --network app_network -p 8080:80 -e PMA_HOST=db phpmyadmin/phpmyadmin
```

<hr>

:bulb: <u>Configure in vite.config.js. Allows external access to the application and defines the port where Vite will run:</u>

```javascript
import { defineConfig } from "vite"; // Imports the configuration function from Vite
import laravel from "laravel-vite-plugin"; // Imports the official Laravel plugin for Vite
import tailwindcss from "@tailwindcss/vite"; // Imports the Tailwind CSS plugin for Vite

export default defineConfig({
    plugins: [
        laravel({
            input: ["resources/css/app.css", "resources/js/app.js"], // Main CSS and JS files to be processed
            refresh: true, // Enables automatic refresh when saving Blade, CSS, or JS files
        }),
        tailwindcss(),
    ],
    server: {
        host: "0.0.0.0", // Allows connections from any IP (required in Docker)
        port: 5173, // Sets the port used by the Vite development server
        hmr: {
            host: "localhost", // Address used by the browser to connect to the WebSocket (HMR)
            port: 5173, // Port used for Hot Module Replacement (HMR)
        },
        watch: {
            usePolling: true, // Forces file checking at intervals (avoids issues in Docker/WSL)
        },
    },
});
```

<hr>
