package main

import (
	"github.com/gofiber/fiber/v2"
	"github.com/jalexanderII/flutter-golang/config"
	"github.com/jalexanderII/flutter-golang/database"
	"github.com/jalexanderII/flutter-golang/middleware"
	"github.com/jalexanderII/flutter-golang/routes"
)

func main() {
	database.ConnectDb()

	app := fiber.New()
	middleware.FiberMiddleware(app)
	routes.SetupRoutes(app)

	// Start server (with graceful shutdown).
	config.StartServerWithGracefulShutdown(app)
}
